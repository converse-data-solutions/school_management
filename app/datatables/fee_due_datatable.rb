class FeeDueDatatable < AjaxDatatablesRails::ActiveRecord
  def initialize(params, opts = {})
    @academic_details = opts[:academic_details]
    super(params)
  end

  def view_columns
    @view_columns ||= {
      serial_number: { source: 'Student.id', orderable: false, cond: :eq, searchable: false },
      standard_name: { source: 'AcademicDetail.standard_name', searchable: true },
      student_id: { source: 'AcademicDetail.student_id' },
      admission_no: { source: 'AcademicDetail.admission_no' },
      name: { source: 'AcademicDetail.name' },
      mobile_number: { source: 'Student.mobile_number' },
      payable_fee: { source: 'AcademicFee.payable_fee' },
      total_payment: { source: 'total_payment', searchable: true },
      pending_payment: { source: 'pending_payment' }

    }
  end

  def data
    records.map.with_index(1) do |record, index|
      {
        serial_number: index,
        standard_name: record.standard_name,
        student_id: record.student_id,
        admission_no: record.admission_no,
        name: record.name,
        mobile_number: record.student.mobile_number,
        payable_fee: record.academic_fee.payable_fee,
        total_payment: record.payments.sum(:paid_amount),
        pending_payment: calculate_pending_payment(record)

      }
    end
  end

  def get_raw_records
    AcademicDetail.includes(:academic_fee, :payments, :student).where(id: @academic_details.pluck(:id)).references(
      :academic_fee, :payments, :student
    )
  end

  private

  def calculate_pending_payment(record)
    payable_fee = record.academic_fee&.payable_fee
    total_payment = record.payments&.sum(:paid_amount)

    if payable_fee.present? && total_payment.present?
      pending_payment = payable_fee - total_payment
      pending_payment.positive? ? pending_payment : 0
    else
      0
    end
  end
end

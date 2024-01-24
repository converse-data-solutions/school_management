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
      total_payment: { source: 'total_payment', orderable: false, searchable: false },
      bending_payment: { source: 'bending_payment', orderable: false, searchable: false }

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
        bending_payment: calculate_bending_payment(record)

      }
    end
  end

  def get_raw_records
    AcademicDetail.includes(:academic_fee, :payments, :student).where(id: @academic_details.pluck(:id))
  end

  private

  def calculate_bending_payment(record)
    payable_fee = record.academic_fee&.payable_fee
    total_payment = record.payments&.sum(:paid_amount)

    if payable_fee.present? && total_payment.present?
      bending_payment = payable_fee - total_payment
      bending_payment.positive? ? bending_payment : 0
    else
      0
    end
  end
end

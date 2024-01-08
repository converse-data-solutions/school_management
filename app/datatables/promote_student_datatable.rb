class PromoteStudentDatatable < AjaxDatatablesRails::ActiveRecord
  def initialize(params, opts = {})
    @from_section = opts[:from_section]
    @all_student = opts[:all_student]
    super(params)
  end

  def view_columns
    @view_columns ||= {
      serial_number: { source: 'Student.id', orderable: false, cond: :eq, searchable: false },
      admission_no: { source: 'Student.admission_no' },
      id: { source: 'Student.id' },
      name: { source: 'Student.name' },
      check_box: { source: 'StudentDecorator.check_box', searchable: false }
    }
  end

  def data
    records.map.with_index(1) do |record, index|
      {
        serial_number: index,
        admission_no: record.admission_no,
        id: record.id,
        name: record.name,
        check_box: record.decorate.check_box
      }
    end
  end

  def get_raw_records
    Student.active.where(section_id: @from_section)
  end
end

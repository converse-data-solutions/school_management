class PromoteStudentDatatable < AjaxDatatablesRails::ActiveRecord
  def initialize(params, opts = {})
    @from_section = opts[:from_section]
    super(params)
  end

  def view_columns
    @view_columns ||= {
      admission_no: { source: 'Student.admission_no' },
      id: { source: 'Student.id' },
      name: { source: 'Student.name' },
      id: { source: 'Student.id' }
    }
  end

  def data
    records.map do |record|
      {
        admission_no: record.admission_no,
        id: record.id,
        name: record.name,
        id: record.decorate.check_box,

        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    # Modify the query based on your display method requirements
    Student.where(section_id: @from_section, deleted: 'Active')
  end
end

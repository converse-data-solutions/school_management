class PromoteStudentDatatable < AjaxDatatablesRails::ActiveRecord
  def initialize(params, opts = {})
    @from_section = opts[:from_section]
    @all_student = opts[:all_student]
    puts 
    super(params)
  end

  def view_columns
    @view_columns ||= {
      id: { source: 'Student.id' },
      admission_no: { source: 'Student.admission_no' },
      name: { source: 'Student.name' },
      check_box: { source: 'StudentDecorator.check_box', searchable: false },

    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        admission_no: record.admission_no,
        name: record.name,
        check_box: @all_student ? true : record.decorate.check_box
      }
    end
  end

  def get_raw_records
    Student.where(section_id: @from_section, deleted: 'Active')
  end
end

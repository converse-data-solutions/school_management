class DisplayStudentDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      admission_no: { source: 'Student.admission_no' },
      name: { source: 'Student.name' },
      student_actions: { source: 'StudentDecorator.student_actions', searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        admission_no: record.decorate.link_to,
        name: record.name,
        student_actions: record.decorate.student_actions
      }
    end
  end

  def get_raw_records
    # Modify the query based on your display method requirements
    Student.where(section_id: @from_section, deleted: 'Active')
  end
end

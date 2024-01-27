class StudentDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      admission_no: { source: 'Student.admission_no' },
      name: { source: 'Student.name' },
      date_of_birth: { source: 'Student.date_of_birth' },
      mobile_number: { source: 'Student.mobile_number', searchable: true },
      standard_name: { source: 'Standard.name', searchable: true },
      section_name: { source: 'Section.section_name', searchable: true },
      roll_no: { source: 'Student.roll_no', searchable: true },
      gender: { source: 'Student.gender', searchable: false },
      student_status: { source: 'StudentDecorator.student_status', searchable: false },
      student_actions: { source: 'StudentDecorator.student_actions', searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        admission_no: record.decorate.link_to,
        name: record.name,
        date_of_birth: record.date_of_birth&.strftime('%d-%m-%Y'),
        mobile_number: record.mobile_number,
        standard_name: record.section.standard.name,
        section_name: record.section.section_name,
        roll_no: record.roll_no,
        gender: record.gender,
        student_status: record.decorate.student_status,
        student_actions: record.decorate.student_actions
      }
    end
  end

  def get_raw_records
    Student.joins(section: :standard).where(removed: false)
  end
end

class StudentDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      admission_no: { source: 'Student.admission_no'},
      name: { source: 'Student.name'},
      date_of_birth: { source: 'Student.date_of_birth'},
      mobile_number: { source: 'Student.mobile_number', searchable: true },      
      section_id: { source: 'Student.section_id.', searchable: false },
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
        date_of_birth: record.date_of_birth,
        mobile_number: record.mobile_number,
        section_id: record.section_id,
        roll_no: record.roll_no,
        gender: record.gender,
        student_status: record.decorate.student_status,
        student_actions: record.decorate.student_actions,
      }
    end
  end

  def get_raw_records
    Student.all
  end

end

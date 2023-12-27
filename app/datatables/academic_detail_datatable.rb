class AcademicDetailDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: 'AcademicDetail.id' },
      student_id: { source: 'AcademicDetail.student_id' },
      admission_no: { source: 'AcademicDetail.admission_no' },
      name: { source: 'AcademicDetail.name' },
      roll_no: { source: 'AcademicDetail.roll_no', searchable: true },
      standard_name: { source: 'AcademicDetail.standard_name', searchable: true },
      section_name: { source: 'AcademicDetail.section_name', searchable: true },
      academic_year: { source: 'AcademicDetail.academic_year', searchable: true },
      academic_action: { source: 'AcademicDetailDecorator.academic_action', searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.decorate.link_to,
        student_id: record.student_id,
        admission_no: record.admission_no,
        name: record.name,
        roll_no: record.roll_no,
        standard_name: record.standard_name,
        section_name: record.section_name,
        academic_year: record.academic_year,
        academic_action: record.decorate.academic_action
      }
    end
  end

  def get_raw_records
    AcademicDetail.all
  end
end

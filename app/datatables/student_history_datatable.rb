class StudentHistoryDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: 'StudentHistory.id' },
      admission_no: { source: 'StudentHistory.admission_no' },
      name: { source: 'StudentHistory.name' },
      roll_no: { source: 'StudentHistory.roll_no', searchable: true },
      section_name: { source: 'StudentHistory.section_name', searchable: true },
      standard_name: { source: 'StudentHistory.standard_name', searchable: true },
      academic_year: { source: 'StudentHistory.academic_year', searchable: true }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        admission_no: record.admission_no,
        name: record.name,
        roll_no: record.roll_no,
        section_name: record.section_name,
        standard_name: record.standard_name,
        academic_year: record.academic_year
      }
    end
  end

  def get_raw_records
    StudentHistory.all
  end
end

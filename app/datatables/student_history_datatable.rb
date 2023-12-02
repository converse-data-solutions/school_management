class StudentHistoryDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: 'StudentHistory.id' },
      admission_no: { source: 'StudentHistory.admission_no' },
      name: { source: 'StudentHistory.name' },
      date_of_birth: { source: 'StudentHistory.date_of_birth' },
      gender: { source: 'StudentHistory.gender' },
      date_of_admission: { source: 'StudentHistory.date_of_admission' },
      father_name: { source: 'StudentHistory.father_name' },
      mother_name: { source: 'StudentHistory.mother_name' },
      address: { source: 'StudentHistory.address' },
      mobile_number: { source: 'StudentHistory.mobile_number', searchable: true },
      roll_no: { source: 'StudentHistory.roll_no', searchable: true },
      section_name: { source: 'StudentHistory.section_id', searchable: true }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        admission_no: record.admission_no,
        name: record.name,
        date_of_birth: record.date_of_birth,
        gender: record.gender,
        date_of_admission: record.date_of_admission,
        father_name: record.father_name,
        mother_name: record.mother_name,
        address: record.address,
        mobile_number: record.mobile_number,
        roll_no: record.roll_no,
        section_name: record.section_id,
      }
    end
  end

  def get_raw_records
    StudentHistory.all
  end
end

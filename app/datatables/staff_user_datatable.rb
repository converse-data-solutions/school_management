class StaffUserDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      name: { source: 'User.name' },
      username: { source: 'User.username', searchable: false },
      email: { source: 'User.email' },
      mobile_number: { source: 'User.mobile_number', searchable: false },
      address: { source: 'User.address', searchable: false },
      profession: { source: 'User.profession', searchable: false },
      gender: { source: 'User.gender', searchable: false },
      staff_status: { source: 'UserDecorator.staff_status', searchable: false },
      staff_actions: { source: 'UserDecorator.staff_actions', searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        name: record.name,
        username: record.decorate.link_to,
        email: record.email,
        mobile_number: record.mobile_number,
        address: record.address,
        profession: record.profession,
        gender: record.gender,
        staff_status: record.decorate.staff_status,
        DT_RowId: record.id,
        staff_actions: record.decorate.staff_actions
      }
    end
  end

  def get_raw_records
    User.activestaff
  end
end

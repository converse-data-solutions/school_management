class StaffUserDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      name: { source: 'User.name'},
      username: { source: 'User.username', searchable: false },
      email: { source: 'User.email' },
      mobile_number: { source: 'User.mobile_number', searchable: false },
      address: { source: 'User.address', searchable: false },
      profession: { source: 'User.profession', searchable: false },
      gender: { source: 'User.gender', searchable: false },
      deleted: { source: 'User.deleted' },
      staff_actions: { source: 'UserDecorator.staff_actions', searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        name: record.name,
        username:record.decorate.link_to,
        email: record.email,
        mobile_number: record.mobile_number,
        address: record.address,
        profession: record.profession,
        gender: record.gender,
        deleted: record.deleted,
        DT_RowId: record.id,
        staff_actions: record.decorate.staff_actions
      }
    end
  end

  def get_raw_records
    User.where(role: 'staff')

  end

end

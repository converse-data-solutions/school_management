class ParentUserDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      name: { source: 'User.name' },
      username: { source: 'User.username', searchable: true, cond: :like },
      email: { source: 'User.email', searchable: false },
      mobile_number: { source: 'User.mobile_number', searchable: false },
      address: { source: 'User.address', searchable: false },
      profession: { source: 'User.profession', searchable: false },
      gender: { source: 'User.gender', searchable: false },
      user_status: { source: 'UserDecorator.user_status', searchable: false },
      dt_actions: { source: 'UserDecorator.dt_actions', searchable: false }
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
        user_status: record.decorate.user_status,
        DT_RowId: record.id,
        dt_actions: record.decorate.dt_actions

      }
    end
  end

  def get_raw_records
    User.activeparent
  end
end

class ParentUserDatatable < AjaxDatatablesRails::ActiveRecord
  # extend Forwardable
  # def_delegator :@view, :check_box_tag
  # def_delegator :@view, :link_to

  # def_delegator :@view, :edit_admin_parent_user_path

  # def initialize(params, opts = {})
  #   @view = opts[:view_context]
  #   super
  # end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      name: { source: 'User.name', searchable: false },
      username: { source: 'User.username', searchable: false },
      email: { source: 'User.email' },
      mobile_number: { source: 'User.mobile_number', searchable: false },
      address: { source: 'User.address', searchable: false },
      profession: { source: 'User.profession', searchable: false },
      gender: { source: 'User.gender', searchable: false },
      deleted: { source: 'User.active' },
      dt_actions: { source: 'UserDecorator.dt_actions' }
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
        dt_actions: record.decorate.dt_actions
      }
    end
  end

  def get_raw_records
    User.where(role: 'parent')
  end
end
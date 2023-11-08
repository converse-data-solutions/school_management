class ParentUserDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      email: { source: 'User.email' },
      mobile_number: { source: 'User.mobile_number', cond: :like, searchable: true },
      name: { source: 'User.name', searchable: false },
      profession: { source: 'User.profession', searchable: false },
    }
  end

  def data
    records.map do |record|
      {
        email: record.email,
        mobile_number: record.mobile_number,
        name: record.name,
        profession: record.profession
      }
    end
  end

  def get_raw_records
    User.all
  end
end

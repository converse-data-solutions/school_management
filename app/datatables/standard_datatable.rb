class StandardDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns

    @view_columns ||= {
     name: { source: 'Standard.name' },
     standard_actions: { source: 'StandardDecorator.standard_actions', searchable: false }

    }
  end

  def data
    records.map do |record|
      {
        name: record.decorate.link_to,
        standard_actions: record.decorate.standard_actions,
      }
    end
  end

  def get_raw_records
    Standard.all
  end
end

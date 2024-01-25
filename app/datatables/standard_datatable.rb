class StandardDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: 'Standard.id' },
      name: { source: 'Standard.name' },
      fee: { source: 'Standard.fee' },
      section_name: { source: 'Section.section_name' },
      standard_actions: { source: 'StandardDecorator.standard_actions', searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.decorate.link_to,
        fee: record.fee,
        section_name: record.sections.map(&:section_name).join(', '),
        standard_actions: record.decorate.standard_actions
      }
    end
  end

  def get_raw_records
    Standard.includes(:sections).where(removed: false).references(:sections)
  end
end

class StandardDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns

    @view_columns ||= {
      standard_name: { source: 'Standard.name' },
    }
  end

  def data
    records.map do |record|
      {
        standard_name: record.name,
        section_name: record.sections.last&.name

      }
    end
  end

  def get_raw_records
    Standard.includes(:sections)

  end
end

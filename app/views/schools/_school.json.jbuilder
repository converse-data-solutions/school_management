json.extract! school, :id, :school_name, :school_address1, :school_address2, :school_email, :school_phone, :academic_year, :created_at, :updated_at
json.url school_url(school, format: :json)

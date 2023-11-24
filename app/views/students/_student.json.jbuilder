json.extract! student, :id, :admission_no, :roll_no, :name, :father_name, :mother_name, :mobile_number, :address, :date_of_birth, :gender, :date_of_admission, :section_id, :user_id, :created_at, :updated_at
json.url student_url(student, format: :json)

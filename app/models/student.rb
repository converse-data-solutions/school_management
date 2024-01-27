class Student < ApplicationRecord
  belongs_to :section
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :attendances, as: :attendable
  has_many :student_academic_details
  before_create :set_initial_status
  after_create :create_academic_detail

  validates :admission_no, uniqueness: { message: 'Admission No. must be unique.' },
                           numericality: { only_integer: true, message: 'Admission No. must be an integer' },
                           presence: { message: 'Please enter Admission No.' },
                           length: { is: 6, message: 'Admission No. must be 6 digits.' }
  validates :section_id, presence: { message: 'Please select Standard and Section.' }
  validates :user_id, presence: { message: 'Please select Parent.' }
  validates :roll_no, presence: { message: 'Please enter Roll No.' }, allow_blank: true
  validates :name, presence: { message: 'Please enter Name.' }, allow_blank: true
  validates :date_of_birth, presence: { message: 'Please select Date of Birth.' }, allow_blank: true

  validates :mobile_number, numericality: {
                              only_integer: true,
                              greater_than_or_equal_to: 0,
                              message: 'Mobile Number Must Be  Positive Integer'
                            },
                            length: {
                              is: 10,
                              message: 'Mobile Number  Must Be Exactly 10 Digits'
                            },
                            allow_blank: true
  scope :active, -> { where(status: 'Active', removed: false) }

  def self.update_sections(student_ids, new_section_id)
    section = Section.find_by(id: new_section_id)

    students = Student.where(id: student_ids)

    students.each do |student|
      history_data = student.attributes.slice(
        'admission_no',
        'roll_no',
        'name'
      )

      AcademicDetail.create(
        history_data.merge(
          'student_id' => student.id,
          'section_name' => section.section_name,
          'section_id' => section.id,
          'standard_name' => section.standard.name,
          'standard_id' => section.standard.id
        )
      )
    end

    students.update_all(section_id: new_section_id)
  end

  private

  def set_initial_status
    self.status = :Active
  end

  def create_academic_detail
    AcademicDetail.create(
      student_id: id,
      admission_no:,
      roll_no:,
      name:,
      section_name: section.section_name,
      standard_name: section.standard.name,
      section_id: section.id,
      standard_id: section.standard.id
    )
  end
end

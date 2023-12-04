class Student < ApplicationRecord
  belongs_to :section
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :attendances, as: :attendable
  has_one :student_history
  before_create :set_initial_status
  before_create :create_or_update_student_history
  before_update :create_or_update_student_history

  validates :admission_no,
            presence: { message: 'Please enter valid Admission No.' },
            numericality: { only_integer: true, message: 'Admission No. must be an integer' }
  validates :section_id, presence: { message: 'Please select Standard and Section.' }
  validates :user_id, presence: { message: 'Please select Parent.' }
  validates :roll_no, presence: { message: 'Please enter Roll No.' }
  validates :name, presence: { message: 'Please enter Name.' }
  validates :date_of_birth, presence: { message: 'Please select Date of Birth.' }

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

  def create_history
    StudentHistory.create(
      student: self,
      name:,
      date_of_birth:,
      gender:,
      mobile_number:,
      section_name: Section.find(section_id).section_name,
      standard_name: Standard.find(Section.find(section_id).standard_id).name,
      roll_no:,
      admission_no:,
      date_of_admission:,
      address:,
      father_name:,
      mother_name:
    )
  end
  public :create_history

  private

  def set_initial_status
    self.deleted = :Active
  end

  def create_or_update_student_history
    if student_history
      student_history.update(
        name:,
        roll_no:,
        admission_no:,
        father_name:,
        mother_name:,
        mobile_number:,
        address:,
        gender:,
        date_of_birth:,
        date_of_admission:,
        section_name: Section.find(section_id).section_name,
        standard_name: Standard.find(Section.find(section_id).standard_id).name
      )
    end
  end
end

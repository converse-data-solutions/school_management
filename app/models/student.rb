class Student < ApplicationRecord
  belongs_to :section
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :attendances, as: :attendable
  has_many :student_history
  before_create :set_initial_status
  after_create :create_history_entry
  before_update :create_or_update_student_history
  

  scope :active, -> { where(deleted: :Active) }

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

  private

  def set_initial_status
    self.deleted = :Active
  end

  def create_history_entry
    StudentHistory.create(
      student_id: id,
      admission_no:,
      roll_no:,
      name:,
      date_of_birth:,
      gender:,
      mobile_number:,
      section_name: Section.find(section_id).section_name,
      standard_name: Standard.find(Section.find(section_id).standard_id).name,
      date_of_admission:,
      address:,
      father_name:,
      mother_name:
    )
  end

  def create_or_update_student_history
    return unless student_history

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

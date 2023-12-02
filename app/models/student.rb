class Student < ApplicationRecord
  belongs_to :section
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :attendances, as: :attendable
  has_one :student_history
  before_create :set_initial_status
  before_destroy :create_or_update_student_history_before_destroy

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

  def create_or_update_student_history_before_destroy
    if student_history
      student_history.update(
        name: name,
        father_name: father_name,
        mother_name: mother_name,
        mobile_number: mobile_number,
        address: address,
        gender: gender,
        date_of_birth: date_of_birth,
        date_of_admission: date_of_admission,
        section_name: section_name,
        user_id: user_id
      )
    else
      StudentHistory.create(
        name: name,
        father_name: father_name,
        mother_name: mother_name,
        mobile_number: mobile_number,
        address: address,
        gender: gender,
        date_of_birth: date_of_birth,
        date_of_admission: date_of_admission,
        section_name: section_name,
        user_id: user_id
      )
    end
  end
end

class Student < ApplicationRecord
  belongs_to :section
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  before_create :set_initial_status

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
end

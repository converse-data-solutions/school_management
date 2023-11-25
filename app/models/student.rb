class Student < ApplicationRecord
  belongs_to :section
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  before_create :set_initial_status

  
  # validates :admission_no, presence: true
  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must contain alphabet character') unless /[a-zA-Z]/.match?(value)
  end
  validates :section_id, presence: true
  validates :user_id, presence: true
  validates :roll_no, presence: true
  
  private
  def set_initial_status
    self.deleted = :Active
  end

end

class School < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  validates_uniqueness_of :singleton_guard

  before_create :set_singleton_guard
  validates :school_address1, presence: { message: 'Please Enter Address' }
  validates :academic_year, presence: { message: 'Please Enter Academic Year' }
  validates :school_phone, numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                           length: { is: 10, message: 'Please Enter Valid Phone Number' },
                           allow_blank: true

  private

  def set_singleton_guard
    raise 'There can be only one School record' if School.exists?

    self.singleton_guard = true
  end
end

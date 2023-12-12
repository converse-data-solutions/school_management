class School < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  validates :school_name, presence: true
  validates :school_address1, presence: true
  validates :school_address2, presence: true
  validates :school_email, presence: true
  validates :school_phone, presence: true
  validates :academic_year, presence: true
end

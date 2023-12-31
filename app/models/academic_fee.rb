class AcademicFee < ApplicationRecord
  belongs_to :academic_detail
  has_many :payments, dependent: :destroy
  accepts_nested_attributes_for :payments, allow_destroy: true
end

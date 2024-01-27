class Standard < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :students, through: :sections
  accepts_nested_attributes_for :sections, allow_destroy: true

end

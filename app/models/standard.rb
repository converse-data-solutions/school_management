class Standard < ApplicationRecord
  has_many :sections
  accepts_nested_attributes_for :sections
end

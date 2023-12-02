class Section < ApplicationRecord
  belongs_to :standard
  has_many :students
end

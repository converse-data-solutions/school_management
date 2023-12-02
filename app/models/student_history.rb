class StudentHistory < ApplicationRecord
  belongs_to :student
  belongs_to :section
end

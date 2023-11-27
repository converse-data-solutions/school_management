class Attendance < ApplicationRecord
  belongs_to :attendable, polymorphic: true
end

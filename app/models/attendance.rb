class Attendance < ApplicationRecord
  belongs_to :attendable, polymorphic: true

  enum status: {
    present: 0,
    late: 1,
    absent: 2
  }

  private

  def set_initial_status
    self.status = :present
  end
end

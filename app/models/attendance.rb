class Attendance < ApplicationRecord
  belongs_to :attendable, polymorphic: true

  enum status: {
    present: 0,
    late: 1,
    absent: 2
  }
  def set_color
    self.color = case status
                 when 'present'
                   'green'
                 when 'late'
                   'turquoise'
                 else
                   'red'
                 end
  end

  private

  def set_initial_status
    self.status = :present
  end
end

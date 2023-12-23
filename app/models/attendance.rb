class Attendance < ApplicationRecord
  belongs_to :attendable, polymorphic: true

  enum status: {
    present: 0,
    late: 1,
    absent: 2
  }
  def set_color(current_user)
    self.created_by = current_user
    self.color = case status
                 when 'present'
                   'green'
                 when 'late'
                   'indigo'
                 when 'absent'
                   'red'
                 else
                   'none'
                 end
  end

  private

  def set_initial_status
    self.status = :present
  end
end

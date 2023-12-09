class Notice < ApplicationRecord
  
  validates :notice_type, presence: true, inclusion: { in: %w(parent staff) }
  validates :notice, presence: true
  validates :notice_date, presence: true
end

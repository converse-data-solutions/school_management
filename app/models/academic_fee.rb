class AcademicFee < ApplicationRecord
  before_create :set_discount
  belongs_to :academic_detail
  has_many :payments, dependent: :destroy

  private

  def set_discount
    self.discount = 0
  end
end

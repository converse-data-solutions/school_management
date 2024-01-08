class AcademicDetail < ApplicationRecord
  before_create :set_initial_academic_year
  after_create :create_academic_fee
  belongs_to :student

  has_one :academic_fee

  private

  def set_initial_academic_year
    self.academic_year = School.first.academic_year
  end

  def create_academic_fee
    AcademicFee.create(academic_detail_id: id)
  end
end

class AcademicDetail < ApplicationRecord
  before_create :set_initial_academic_year
  belongs_to :student

  private

  def set_initial_academic_year
    self.academic_year = School.first.academic_year
  end
end

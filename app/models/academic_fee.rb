class AcademicFee < ApplicationRecord
  before_create :set_discount
  belongs_to :academic_detail
  has_many :payments, dependent: :destroy

  def self.find_section_by_params(params)
    Standard.find_by(id: params[:standard_id]).sections.select(:id, :section_name)
  end

  def self.find_student_by_params(params)
    Student.where(id: params[:student_id]).or(Student.where(admission_no: params[:admission_no])).first
  end

  def self.find_students(params)
    Section.find_by(id: params[:section_id]).students.select(:id, :name)
  end

  private

  def set_discount
    self.discount = 0
  end
end

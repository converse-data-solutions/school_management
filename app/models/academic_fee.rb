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

  def self.find_academic_fee(params)
    return unless (params[:student_id].present? || params[:admission_no].present?) && params[:academic_year].present?

    key = params[:student_id].present? ? :student_id : :admission_no
    academic_detail = AcademicDetail.find_by({ key => params[key], academic_year: params[:academic_year] })
    return nil unless academic_detail

    fee = Standard.find_by(id: academic_detail.standard_id)&.fee
    academic_fee = AcademicFee.find_by(academic_detail_id: academic_detail.id)
    payments = AcademicFee.includes(:payments).where(academic_detail_id: academic_detail.id)

    {
      academic_detail:,
      fee:,
      academic_fee:,
      payments:
    }
  end

  private

  def set_discount
    self.discount = 0
  end
end

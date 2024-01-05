module AcademicFeeCommon
  extend ActiveSupport::Concern

  private

  def common_instance_variables(academic_detail)
    @fee = Standard.find_by(id: academic_detail.standard_id)&.fee
    @academic_fee = AcademicFee.find_by(academic_detail_id: academic_detail.id)
    @payments = AcademicFee.where(academic_detail_id: academic_detail.id).includes(:payments)
  end
end

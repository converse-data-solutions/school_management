# app/controllers/concerns/filter_helper.rb
module FilterHelper
  extend ActiveSupport::Concern

  included do
    before_action :set_payment_date, only: [:filter]
  end

  def filter
    if params_present?(params, %i[standard_id section_id student_id admission_no])
      key = params[:student_id].present? ? :student_id : :admission_no
      filter_by_criteria(@payment_date, key, params[key])
    else
      redirect_to academic_fees_url, notice: 'Academic details not found'
    end
  end

  private

  def set_payment_date
    @payment_date = params[:payment_date].presence || DateTime.now.in_time_zone('Asia/Kolkata').strftime('%Y-%m-%d %I:%M:%S %p')
  end

  def filter_by_criteria(payment_date, criteria_key, criteria_value)
    @academic_detail = AcademicDetail.find_by({ criteria_key => criteria_value, academic_year: params[:academic_year] })
    @payment_date = payment_date
    respond_to do |format|
      if @academic_detail
        common_instance_variables(@academic_detail)
        format.turbo_stream
      else
        format.turbo_stream { head :no_content }
      end
    end
  end

  def params_present?(params, keys)
    keys.any? { |key| params[key].present? }
  end
end

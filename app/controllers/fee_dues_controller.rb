class FeeDuesController < ApplicationController

  def index
    @fee_dues = Payment.all
  end

  def filter_fee_due
    @academic_details = AcademicDetail.where(section_id: params[:section_id], academic_year: params[:academic_year])
  
    if @academic_details.present?
      @academic_fees = @academic_details.map(&:academic_fee).uniq
     
    else
      puts "No academic details found for the specified parameters."
    end
  end

  def find_academic_sections
    @sections = Standard.find_by(id: params[:standard_id]).sections
    respond_to(&:js)
  end
end

class FeeDuesController < ApplicationController
  def index
    @academic_details = AcademicDetail.where(section_id: params[:section_id], academic_year: params[:academic_year])

    respond_to do |format|
      format.html
      format.json do
        render json: FeeDueDatatable.new(params, view_context:, academic_details: @academic_details)
      end
    end
  end

  def filter_fee_due
    @academic_details = AcademicDetail.where(section_id: params[:section_id], academic_year: params[:academic_year])

    @academic_fees = if @academic_details.present?
                       @academic_details.map(&:academic_fee).uniq

                     else
                       []
                     end
  end

  def find_academic_sections
    @sections = Standard.find_by(id: params[:standard_id]).sections
  end
end

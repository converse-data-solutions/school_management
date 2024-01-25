class FeeDuesController < ApplicationController
  def index
    @academic_details = AcademicDetail.by_section_and_year(params[:section_id], params[:academic_year])

    respond_to do |format|
      format.html
      format.json do
        render json: FeeDueDatatable.new(params, view_context:, academic_details: @academic_details)
      end
    end
  end


  def find_academic_sections
    @sections = Standard.find_by(id: params[:standard_id]).sections
  end
end

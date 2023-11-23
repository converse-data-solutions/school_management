class SectionsController < ApplicationController
  def destroy
    @standard = Standard.find(params[:standard_id])
    @section = @standard.sections.find(params[:id])
    @section.destroy
  end
end

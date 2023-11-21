class StandardsController < ApplicationController
  def index
    @standards= Standard.all
    @standard = Standard.new
    @standard.sections.build
    respond_to do |format|
      format.html
      format.json { render json: StandardDatatable.new(params, view_context: view_context) }
    end
  end

  def create
    @standard = Standard.new(standard_params)
    if @standard.save
      redirect_to standards_path, notice: 'Standard created successfully.'
    else
      render 'index'
    end
  end

  private

  def standard_params
    params.require(:standard).permit(:name, sections_attributes: [:name])
  end
end
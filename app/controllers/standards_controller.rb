class StandardsController < ApplicationController
  def index
    @standard = Standard.new
    @standard.sections.build
    respond_to do |format|
      format.html
      format.json { render json: StandardDatatable.new(params) }
    end
  end

  def create
    @standard = Standard.new(standard_params)
    if @standard.save
      redirect_to standards_path
    else
      render 'index'
    end
  end

  def edit
    @standard = Standard.find(params[:id])
  end

  def update
    
    @standard = Standard.find(params[:id])
    if @standard.update(standard_params)
      redirect_to standards_path
    else
      render 'edit'
    end
  end

  def destroy
    @standard = Standard.find(params[:id])
    @standard.destroy
    redirect_to standards_path, notice: 'Standard deleted successfully.'
  end

  def destroy_section
    @standard = Standard.find(params[:standard_id])
    section = @standard.sections.find(params[:id])
    section.destroy
    redirect_to edit_standard_path(@standard), notice: 'Section deleted successfully.'
  end


  private

  def standard_params
    params.require(:standard).permit(:name, sections_attributes: [:id, :section_name, :_destroy])

  end
end

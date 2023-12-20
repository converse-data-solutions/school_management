# frozen_string_literal: true

# this is a controller for standards page
class StandardsController < ApplicationController
  include AuthorizationHelper
  before_action :check_admin_role
  before_action :set_standard, only: %i[edit update destroy]
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
    return if @standard.present?

    redirect_to standards_path
  end

  def update
    if @standard.update(standard_params)
      redirect_to standards_path
    else
      render 'edit'
    end
  end

  def destroy
    @standard.destroy
    redirect_to standards_path, notice: 'Standard deleted successfully.'
  end

  private

  def set_standard
    @standard = Standard.find_by(id: params[:id])
  end

  def standard_params
    params.require(:standard).permit(:name, :fee, sections_attributes: %i[id section_name _destroy])
  end
end

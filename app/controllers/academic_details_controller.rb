# frozen_string_literal: true

# this is a controller for student history page
class AcademicDetailsController < ApplicationController
  include AuthorizationHelper
  before_action :check_admin_role
  before_action :set_academic_detail, only: %i[edit update destroy]
  def index
    @student_histories = AcademicDetail.all

    respond_to do |format|
      format.html
      format.json { render json: AcademicDetailDatatable.new(params) }
    end
  end

  def edit
    return if @academic_detail.present?

    flash[:alert] = 'Academic Detail not found.'
    redirect_to academic_details_path
  end

  def update
    if @academic_detail.update(academic_detail_params)
      flash[:notice] = 'Academic Detail updated successfully.'
      redirect_to academic_details_path
    else
      flash[:alert] = 'Failed to update Academic Detail.'
      render 'edit'
    end
  end

  def destroy
    if @academic_detail&.update(removed: true)
      flash[:notice] = 'Academic Detail deleted successfully.'
    else
      flash[:alert] = 'Failed to delete Academic Detail.'
    end

    redirect_to academic_details_path
  end

  private

  def academic_detail_params
    params.require(:academic_detail).permit(:admission_no, :name, :section_name, :standard_name, :academic_year)
  end

  def set_academic_detail
    @academic_detail = AcademicDetail.find_by(id: params[:id])
  end
end

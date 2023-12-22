# frozen_string_literal: true

# Parent::ParentNoticesController
class Staff::StaffAttendanceViewsController < ApplicationController  # rubocop:disable Style/ClassAndModuleChildren
  def index
    @staff_id = current_user.id
    @selected_date = params[:selected_date]
    @attendances = Attendance.where(attendable_id: @staff_id, date: @selected_date)
    respond_to do |format|
      format.json { render json: @attendances }
      format.html { render :index }
    end
  end
end

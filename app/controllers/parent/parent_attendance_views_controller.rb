class Parent::ParentAttendanceViewsController < ApplicationController
  include AuthorizationParentHelper
  before_action :check_user_role
  # GET /parent/parent_attendance_views or /parent/parent_attendance_views.json
  def index
    @student = params[:student_id]
    @selected_date = params[:selected_date]
    @attendances = Attendance.where(attendable_id: @student, date: @selected_date)
    respond_to do |format|
      format.json { render json: @attendances }
      format.html { render :index }
    end
  end
end

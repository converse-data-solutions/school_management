class Staff::StaffAttendanceViewsController < ApplicationController
  before_action :set_staff_staff_attendance_view, only: %i[show edit update destroy]

  # GET /staff/staff_attendance_views or /staff/staff_attendance_views.json
  def index
    @staff_id = current_user.id
    @selected_date = params[:selected_date]
    @attendances = Attendance.where(attendable_id: @staff_id, date: @selected_date)
    respond_to do |format|
      format.json { render json: @attendances }
      format.html { render :index }
    end
  end

  # GET /staff/staff_attendance_views/1 or /staff/staff_attendance_views/1.json
end

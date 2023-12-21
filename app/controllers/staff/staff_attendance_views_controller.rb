class Staff::StaffAttendanceViewsController < ApplicationController
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

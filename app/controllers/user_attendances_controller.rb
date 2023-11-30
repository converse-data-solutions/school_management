# app/controllers/user_attendances_controller.rb
class UserAttendancesController < ApplicationController
  # before_action :set_user

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      redirect_to user_attendances_path(date: @attendance.date)
    else
      render :new
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance
      @attendance.update(attendance_params)
      redirect_to user_attendances_path(date: @attendance.date)
    else
      flash[:error] = 'Attendance record not found.'
      redirect_to user_attendances_path
    end
  end
  def update_all
    # Use strong parameters to permit necessary attributes
    attendances_params = params.require(:attendances).permit!

    attendances_params.each do |user_id, attendance_params|
      user = User.find(attendance_params[:attendable_id])
      attendance = Attendance.find_or_initialize_by(attendable_id: user.id, attendable_type: user.class.name, date: attendance_params[:date])
      attendance.update(attendance_params)
    end

    # Redirect or render as needed
    redirect_to user_attendances_path
  end

  def index
    @users = User.where(role: 'staff')
    @selected_date = params[:date]

  end

  private

  def attendance_params
    params.require(:attendance).permit(:date, :status, :attendable_id, :attendable_type)
  end
end

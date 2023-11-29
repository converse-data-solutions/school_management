# app/controllers/user_attendances_controller.rb
class UserAttendancesController < ApplicationController
  # before_action :set_user

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      redirect_to user_attendances_path
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
      redirect_to user_attendances_path
    else
      flash[:error] = 'Attendance record not found.'
      redirect_to user_attendances_path
    end
  end

  def index
    @users = User.where(role: 'staff')
    @selected_date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  private

  def set_user
    @user = User.all
  end

  def attendance_params
    params.require(:attendance).permit(:date, :status, :attendable_id, :attendable_type)
  end
end

class UserAttendancesController < ApplicationController


  def new
    @attendance = @user.attendances.new
  end

  def create
    @attendance = @user.attendances.new(attendance_params)

    if @attendance.save
      redirect_to @user, notice: 'User Attendance was successfully created.'
    else
      render :new
    end
  end

  def index
    @attendances = User.where(role: 'staff')
  end

  def edit
    @attendance = @user.attendances.find(params[:id])
  end

  def update
    @attendance = @user.attendances.find(params[:id])

    if @attendance.update(attendance_params)
      redirect_to @user, notice: 'User Attendance was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def attendance_params
    params.require(:attendance).permit(:date, :status)
  end
end

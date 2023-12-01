class UserAttendancesController < ApplicationController

  def update_all
    attendances_params = params.require(:attendances).permit!

    attendances_params.each do |_user_id, attendance_params|
      user = User.find(attendance_params[:attendable_id])
      attendance = Attendance.find_or_initialize_by(attendable_id: user.id, attendable_type: user.class.name,
                                                    date: attendance_params[:date])
      attendance.update(attendance_params)
    end

    redirect_to new_user_attendance_path
  end

  def index
    @users = User.where(role: 'staff')
    @selected_date = params[:date]
  end
end

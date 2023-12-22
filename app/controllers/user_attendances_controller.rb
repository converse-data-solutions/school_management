# frozen_string_literal: true

# this is a controller for user attendance page
class UserAttendancesController < ApplicationController
  include AuthorizationHelper
  before_action :check_admin_role
  def update_all
    attendances_params = params.require(:attendances).permit!

    attendances_params.each do |_user_id, attendance_params|
      update_or_create_user_attendance(attendance_params)
    end

    redirect_to new_user_attendance_path
  end

  def index
    @users = User.where(role: 'staff', deleted: 'Active')
    @selected_date = params[:date]
  end

  private

  def update_or_create_user_attendance(attendance_params)
    user = User.find(attendance_params[:attendable_id])
    attendance = Attendance.find_or_initialize_by(attendable_id: user.id, attendable_type: user.class.name,
                                                  date: attendance_params[:date], created_by: current_user.id)
    attendance.update(attendance_params)
    attendance.set_color
    attendance.save
  end
end

# frozen_string_literal: true

# this is a controller for student attendance page
class StudentAttendancesController < ApplicationController
  before_action :check_role
  def find_sections
    @sections = Standard.find_by(id: params[:standard_id]).sections
    respond_to(&:js)
  end

  def update_all
    attendances_params = params.require(:attendances).permit!

    attendances_params.each do |_student_id, attendance_params|
      update_or_create_attendance(attendance_params)
    end

    redirect_to student_attendances_path
  end

  def index
    @selected_date = params[:date]
    @selected_standard = params[:standard_id]
    @selected_section = params[:section_id]
    @students = Student.active.where(section_id: @selected_section)
  end

  def attendance_view
  end

  private

  def check_role
    return if current_user && (current_user.role == 'admin' || current_user.role == 'staff')

    flash[:alert] = 'You do not have permission to access this page.'
    redirect_to root_path
  end

  def update_or_create_attendance(attendance_params)
    student_id = attendance_params[:attendable_id]
    date = attendance_params[:date]

    student = Student.find(student_id)
    attendance = Attendance.find_or_initialize_by(attendable_id: student_id, attendable_type: student.class.name,
                                                  date:)

    attendance.update(attendance_params)
    attendance.set_color(current_user.id)
    attendance.save
  end
end

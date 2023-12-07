class StudentAttendancesController < ApplicationController
  def find_sections
    @sections = Standard.find(params[:standard_id]).sections
    respond_to(&:js)
  end

  def update_all
    attendances_params = params.require(:attendances).permit!

    attendances_params.each do |_student_id, attendance_params|
      student = Student.find(attendance_params[:attendable_id])

      attendance = Attendance.find_or_initialize_by(attendable_id: student.id, attendable_type: student.class.name,
                                                    date: attendance_params[:date])
      attendance.update(attendance_params)
    end
    redirect_to student_attendances_path
  end

  def index
    @selected_date = params[:date]
    @selected_standard = params[:standard_id]
    @selected_section = params[:section_id]
    @students = Student.where(section_id: @selected_section, deleted: 'Active')
  end
end

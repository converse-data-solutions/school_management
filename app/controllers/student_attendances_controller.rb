class StudentAttendancesController < ApplicationController
  # before_action :set_student

  def new
    @attendance = @student.attendances.new
  end

  def create
    @attendance = @student.attendances.new(attendance_params)

    if @attendance.save
      redirect_to @student, notice: 'Student Attendance was successfully created.'
    else
      render :new
    end
  end

  def edit
    @attendance = @student.attendances.find(params[:id])
  end

  def update
    @attendance = @student.attendances.find(params[:id])

    if @attendance.update(attendance_params)
      redirect_to @student, notice: 'Student Attendance was successfully updated.'
    else
      render :edit
    end
  end

  def update_all
    # Use strong parameters to permit necessary attributes
    attendances_params = params.require(:attendances).permit!

    attendances_params.each do |_student_id, attendance_params|
      student = Student.find(attendance_params[:attendable_id])
      attendance = Attendance.find_or_initialize_by(attendable_id: student.id, attendable_type: student.class.name,
                                                    date: attendance_params[:date])
      attendance.update(attendance_params)
    end

    # Redirect or render as needed
    redirect_to student_attendances_path
  end

  def index
    
    @selected_date = params[:date]
    @selected_standard = params[:standard_id]
    @selected_section = params[:section_id]
    @students = Student.where(section_id: @selected_section)
   
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def attendance_params
    params.require(:attendance).permit(:date, :status)
  end
end

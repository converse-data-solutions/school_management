class StudentAttendancesController < ApplicationController
  before_action :set_student

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

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def attendance_params
    params.require(:attendance).permit(:date, :status)
  end
end


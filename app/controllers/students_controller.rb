class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy active_student]
  before_action :selected_sections, only: %i[find_sections find_from_sections find_to_sections]
  include UserStatusToggle

  def index
    respond_to do |format|
      format.html
      format.json { render json: StudentDatatable.new(params) }
    end
  end

  def show; end

  def find_sections
    respond_to(&:js)
  end

  def find_from_sections
    respond_to(&:js)
  end

  def find_to_sections
    respond_to(&:js)
  end

  def active_student
    toggle_user_status
    redirect_to students_path
  end

  def new
    @student = Student.new
  end

  def edit
    return if @student.present?

    flash[:alert] = 'Student not found.'
    redirect_to students_path
  end

  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to students_url, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_url, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy!
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def promote
    @selected_standard = params[:from_standard_id]
    @to_section = params[:to_section_id]
    respond_to do |format|
      format.html
      format.json do
        render json: PromoteStudentDatatable.new(params, view_context:, from_section: params[:from_section_id])
      end
    end
  end

  def update_sections
    student_ids = params[:students]
    new_section_id = params[:new_section_id]
    Student.update_sections(student_ids, new_section_id)
    redirect_to promote_students_path, notice: 'Sections updated successfully.'
  end

  private

  def set_student
    @student = Student.find_by(id: params[:id])
  end

  def student_params
    params.require(:student).permit(:admission_no, :roll_no, :name, :father_name, :mother_name, :mobile_number,
                                    :address, :date_of_birth, :gender, :date_of_admission, :section_id, :user_id, :image, :deleted)
  end

  def selected_sections
    @sections = Standard.find_by(id: params[:standard_id]).sections
  end
end

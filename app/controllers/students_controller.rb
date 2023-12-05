class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.all
    @standards = Standard.all
    respond_to do |format|
      format.html
      format.json { render json: StudentDatatable.new(params) }
    end
  end

  def show; end

  def getting_sections
    @sections = Standard.find(params[:standard_id]).sections
    respond_to(&:js)
  end

  def getting_from_sections
    @sections = Standard.find(params[:standard_id]).sections
    respond_to(&:js)
  end

  def getting_to_sections
    @sections = Standard.find(params[:standard_id]).sections
    respond_to(&:js)
  end

  def active_student
    @student = Student.find(params[:id])
    toggle_user_status
    redirect_to students_path
  end

  def new
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if save_student_and_create_history
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
    @from_section = params[:from_section_id]
    @to_section = params[:to_section_id]
    @all_student = params[:additional_param]

    @students = Student.where(section_id: @from_section, deleted: 'Active')
    respond_to do |format|
      format.html
      format.json do
        render json: PromoteStudentDatatable.new(params, view_context:, from_section: @from_section)
      end
    end
  end

  def update_sections
    student_ids = params[:student_ids]
    new_section_id = params[:new_section_id]

    Student.where(id: student_ids).update_all(section_id: new_section_id)

    redirect_to promote_students_path, notice: 'Sections updated successfully.'
  end

  private

  def save_student_and_create_history
    if @student.save
      @student.create_history
      true
    else
      false
    end
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:admission_no, :roll_no, :name, :father_name, :mother_name, :mobile_number,
                                    :address, :date_of_birth, :gender, :date_of_admission, :section_id, :user_id, :image, :deleted)
  end

  def toggle_user_status
    new_status = @student.deleted == 'Active' ? 'Inactive' : 'Active'
    @student.update(deleted: new_status)
    flash[:notice] = 'Status changed successfully.'
  end
end

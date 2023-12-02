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

  def get_sections
    @sections = Standard.find(params[:standard_id]).sections
    respond_to(&:js)
  end

  def active_student
    @student = Student.find(params[:id])
    toggle_user_status
    redirect_to students_path
  end

  def new
    @standards = Standard.all
    @sections = @standard&.sections || []
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        create_student_history(@student)
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

  private

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
  def create_student_history(student)
    # Create a StudentHistory record with individual attribute values
    StudentHistory.create(
      student: student,
      name: student.name,
  date_of_birth: student.date_of_birth,
  gender: student.gender,
  mobile_number: student.mobile_number,
  section_id: student.section_id,
  roll_no: student.roll_no,
  admission_no: student.admission_no,
  date_of_admission: student.date_of_admission,
  address: student.address,
 father_name: student.father_name,
  mother_name: student.mother_name
      
    )
  end
end

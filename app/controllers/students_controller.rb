class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
    respond_to do |format|
      format.html
      format.json { render json: StudentDatatable.new(params) }
  end
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # def sections_by_standard
  #   standard_id = params[:standard_id]
  #   sections = Section.where(standard_id: standard_id)
  #   render json: sections
  # end
  def get_sections
    @sections = Standard.find(params[:standard_id]).sections
    respond_to do |format|
      format.js
    end
  end

  def active_user
    toggle_user_status
    redirect_to students_path
  end
  

  # GET /students/new
  def new
    @standards = Standard.all
    puts "@standards: #{@standards.inspect}" # Check the output in your server logs
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy!

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:admission_no, :roll_no, :name, :father_name, :mother_name, :mobile_number, :address, :date_of_birth, :gender, :date_of_admission, :section_id, :user_id, :image, :deleted)
    end

    def toggle_user_status
      new_status = @user.deleted == 'Active' ? 'Inactive' : 'Active'
      @student.update(deleted: new_status)
      flash[:notice] = 'Status changed successfully.'
    end
end

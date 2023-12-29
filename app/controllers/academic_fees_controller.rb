class AcademicFeesController < ApplicationController
  before_action :set_academic_fee, only: %i[show edit update destroy]

  # GET /academic_fees or /academic_fees.json
  def index
    @academic_fees = AcademicFee.all
    @student = Student.all
  end

  def filter
    student_id = params[:student_id]
    academic_year = params[:academic_year]
    
    # Fetch academic details based on student_id and academic_year
    @academic_fee = AcademicDetail.find_by(student_id: student_id, academic_year: academic_year)
  
    # Ensure that @academic_fee is not nil before proceeding
    if @academic_fee
      # Fetch Standard based on the name with a partial match
      @fee = Standard.where("name LIKE ?", "%#{@academic_fee.standard_name}%")
  
      respond_to do |format|
        format.turbo_stream
      end
    else
      # Handle the case where academic details are not found
      # You might want to add some error handling or redirect to an error page
    end
  end
  

  # GET /academic_fees/1 or /academic_fees/1.json
  def show; end

  def find_academic_sections
    @sections = Standard.find_by(id: params[:standard_id]).sections
    respond_to(&:js)
  end

  def find_students
    @students = Section.find_by(id: params[:section_id]).students
    respond_to(&:js)
  end

  def find_student_details
    if params[:student_id].present?
      @student = Student.find_by(id: params[:student_id])
    elsif params[:admission_no].present?
      @student = Student.find_by(admission_no: params[:admission_no])
    end

    respond_to(&:js)
  end

  # GET /academic_fees/new
  def new
    @academic_fee = AcademicFee.new
  end

  # GET /academic_fees/1/edit
  def edit; end

  # POST /academic_fees or /academic_fees.json
  def create
    @academic_fee = AcademicFee.new(academic_fee_params)

    respond_to do |format|
      if @academic_fee.save
        format.html { redirect_to academic_fee_url(@academic_fee), notice: 'Academic fee was successfully created.' }
        format.json { render :show, status: :created, location: @academic_fee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @academic_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_fees/1 or /academic_fees/1.json
  def update
    respond_to do |format|
      if @academic_fee.update(academic_fee_params)
        format.html { redirect_to academic_fee_url(@academic_fee), notice: 'Academic fee was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_fee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @academic_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_fees/1 or /academic_fees/1.json
  def destroy
    @academic_fee.destroy!

    respond_to do |format|
      format.html { redirect_to academic_fees_url, notice: 'Academic fee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_academic_fee
    @academic_fee = AcademicFee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def academic_fee_params
    params.require(:academic_fee).permit(:discount, :actual_fee, :payable_fee, :academic_detail_id)
  end
end

class AcademicFeesController < ApplicationController
  before_action :set_academic_fee, only: %i[show edit update destroy]

  # GET /academic_fees or /academic_fees.json
  def index
    @academic_fees = AcademicFee.all
    @student = Student.all
  end

  def filter
    if params_present?(params, %i[standard_id section_id student_id date])
      filter_by_student
    elsif params_present?(params, %i[admission_no date])
      filter_by_admission_no
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
        format.turbo_stream
        format.json { render :show, status: :created, location: @academic_fee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
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

  def params_present?(params, keys)
    keys.any? { |key| params[key].present? }
  end

  def filter_by_student
    @academic_detail = AcademicDetail.find_by(student_id: params[:student_id], academic_year: params[:academic_year])

    respond_to do |format|
      if @academic_detail
        @fee = Standard.find_by(id: @academic_detail.standard_id)&.fee
        format.turbo_stream
      else
        handle_academic_details_not_found
      end
    end
  end

  def filter_by_admission_no
    @academic_detail = AcademicDetail.find_by(admission_no: params[:admission_no], academic_year: params[:academic_year])

    respond_to do |format|
      if @academic_detail
        @fee = Standard.find_by(id: @academic_detail.standard_id)&.fee
        format.turbo_stream
      else
        handle_academic_details_not_found
      end
    end
  end

  def handle_academic_details_not_found
    # Handle the case where academic details are not found
    # You might want to add some error handling or redirect to an error page
  end
end

class AcademicFeesController < ApplicationController
  before_action :set_academic_fee, only: %i[show edit update destroy create_payment]

  # GET /academic_fees or /academic_fees.json
  def index; end

  def filter
    @payment_date = if params[:payment_date].present?
                      params[:payment_date]
                    else
                      DateTime.now.in_time_zone('Asia/Kolkata').strftime('%Y-%m-%d %I:%M:%S %p')
                    end
    if params_present?(params, %i[standard_id section_id student_id])
      filter_by_student(@payment_date)
    elsif params_present?(params, %i[admission_no])
      filter_by_admission_no(@payment_date)
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

  def pay_fee
    respond_to(&:js)
  end

  def changed_fee
    respond_to(&:js)
  end
  

  # GET /academic_fees/new
  def new
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
        format.turbo_stream
        format.json { render :show, status: :ok, location: @academic_fee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream
        format.json { render json: @academic_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_payment
    @payment = @academic_fee.payments.new(payment_params)
    @payment_info = params[:payment_info]
    @paid_amount = params[:paid]
    

    respond_to do |format|
      if @payment.save
        format.html { redirect_to academic_fee_url(@academic_fee), notice: 'Payment was successfully created.' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('payment_details_form', partial: 'academic_fees/filter_form', locals: { payment_date: @payment_date , academic_fee: @academic_fee, payment: @payment }) }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.turbo_stream
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
    @academic_fee = AcademicFee.find_by(id: params[:id])
  end

  def payment_params
    params.require(:payment).permit(:payment_info, :mode_of_pay, :paid_amount, :paid_by, :paid_at)
  end

  # Only allow a list of trusted parameters through.
  def academic_fee_params
    params.require(:academic_fee).permit(:discount, :actual_fee, :payable_fee, :academic_detail_id, :discount,
                                         :payable_fee)
  end

  def params_present?(params, keys)
    keys.any? { |key| params[key].present? }
  end

  def filter_by_student(payment_date)
    @academic_detail = AcademicDetail.find_by(student_id: params[:student_id], academic_year: params[:academic_year])
    @payment_date = payment_date
    respond_to do |format|
      if @academic_detail 
        @fee = Standard.find_by(id: @academic_detail.standard_id)&.fee
        @academic_fee = AcademicFee.find_by(academic_detail_id: @academic_detail.id)
        @payments = AcademicFee.where(academic_detail_id: @academic_detail.id).includes(:payments)

        format.turbo_stream
      else
        handle_academic_details_not_found
      end
    end
  end

  def filter_by_admission_no(payment_date)
    @academic_detail = AcademicDetail.find_by(admission_no: params[:admission_no],
                                              academic_year: params[:academic_year])
    @payment_date = payment_date
    respond_to do |format|
      if @academic_detail
        @fee = Standard.find_by(id: @academic_detail.standard_id)&.fee
        @academic_fee = AcademicFee.find_by(academic_detail_id: @academic_detail.id)
        @payments = AcademicFee.where(academic_detail_id: @academic_detail.id).includes(:payments)
        format.turbo_stream
      else
        handle_academic_details_not_found
      end
    end
  end

  def handle_academic_details_not_found
    redirect_to academic_fees_url, notice: 'Academic details not found'
  end
end

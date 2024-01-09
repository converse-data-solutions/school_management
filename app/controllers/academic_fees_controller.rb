class AcademicFeesController < ApplicationController
  include AcademicFeeCommon
  include AuthorizationHelper
  include FilterHelper
  before_action :check_admin_role, :set_academic_fee, only: %i[edit update create_payment]

  def index; end

  def find_academic_sections
    @sections = Standard.find_by(id: params[:standard_id]).sections.select(:id, :section_name)
  end

  def find_students
    @students = Section.find_by(id: params[:section_id]).students.select(:id, :name)
  end

  def find_student_details
    @student = find_student_by_params(params)
  end

  def pay_fee; end

  def changed_fee; end

  def edit; end

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
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('payment_details_form', partial: 'academic_fees/filter_form',
                                                                            locals: { payment_date: @payment_date, academic_fee: @academic_fee, payment: @payment })
        end

      else
        format.html { render :show, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  private

  def set_academic_fee
    @academic_fee = AcademicFee.find_by(id: params[:id])
  end

  def payment_params
    params.require(:payment).permit(:payment_info, :mode_of_pay, :paid_amount, :paid_by, :paid_at)
  end

  def academic_fee_params
    params.require(:academic_fee).permit(:discount, :actual_fee, :payable_fee, :academic_detail_id, :discount,
                                         :payable_fee)
  end

  def find_student_by_params(params)
    Student.find_by(params[:student_id].present? ? { id: params[:student_id] } : { admission_no: params[:admission_no] })
  end
end

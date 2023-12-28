class AcademicFeesController < ApplicationController
  before_action :set_academic_fee, only: %i[ show edit update destroy ]

  # GET /academic_fees or /academic_fees.json
  def index
    @academic_fees = AcademicFee.all
  end

  # GET /academic_fees/1 or /academic_fees/1.json
  def show
  end

  # GET /academic_fees/new
  def new
    @academic_fee = AcademicFee.new
  end

  # GET /academic_fees/1/edit
  def edit
  end

  # POST /academic_fees or /academic_fees.json
  def create
    @academic_fee = AcademicFee.new(academic_fee_params)

    respond_to do |format|
      if @academic_fee.save
        format.html { redirect_to academic_fee_url(@academic_fee), notice: "Academic fee was successfully created." }
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
        format.html { redirect_to academic_fee_url(@academic_fee), notice: "Academic fee was successfully updated." }
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
      format.html { redirect_to academic_fees_url, notice: "Academic fee was successfully destroyed." }
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

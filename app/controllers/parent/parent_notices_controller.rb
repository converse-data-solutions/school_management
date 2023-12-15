class Parent::ParentNoticesController < ApplicationController
  before_action :set_notice, only: %i[show edit update destroy]

  # GET /parent/notices or /parent/notices.json
  def index
    @parent_notices = Notice.where(notice_type: 'parent', notice_date: Date.today)
    @students = Student.where(user_id: current_user.id)
    @attendances = Attendance.where(attendable_id: @students)

    respond_to do |format|
      format.json { render json: @attendances }
      format.html { render :index }
    end
  end

  # GET /parent/notices/1 or /parent/notices/1.json
  def show; end

  # GET /parent/notices/new
  def new
    @notice = Notice.new
  end

  # GET /parent/notices/1/edit
  def edit; end

  # POST /parent/notices or /parent/notices.json
  def create
    @notice = Notice.new(notice_params)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to parent_notice_url(@notice), notice: 'Notice was successfully created.' }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parent/notices/1 or /parent/notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to parent_notice_url(@notice), notice: 'Notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent/notices/1 or /parent/notices/1.json
  def destroy
    @notice.destroy!

    respond_to do |format|
      format.html { redirect_to parent_notices_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notice
    @notice = Notice.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def notice_params
    params.fetch(:notice, {})
  end
end

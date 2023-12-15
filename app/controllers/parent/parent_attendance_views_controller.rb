class Parent::ParentAttendanceViewsController < ApplicationController
  before_action :set_parent_parent_attendance_view, only: %i[show edit update destroy]

  # GET /parent/parent_attendance_views or /parent/parent_attendance_views.json
  def index
    @student = params[:student_id]
    @attendances = Attendance.where(attendable_id: @student)
    respond_to do |format|
      @student_attendance = format.json { render json: @attendances }
      format.html { render :index }
    end
  end

  # GET /parent/parent_attendance_views/1 or /parent/parent_attendance_views/1.json
  def show; end

  # GET /parent/parent_attendance_views/new
  def new
    @parent_parent_attendance_view = Parent::ParentAttendanceView.new
  end

  # GET /parent/parent_attendance_views/1/edit
  def edit; end

  # POST /parent/parent_attendance_views or /parent/parent_attendance_views.json
  def create
    @parent_parent_attendance_view = Parent::ParentAttendanceView.new(parent_parent_attendance_view_params)

    respond_to do |format|
      if @parent_parent_attendance_view.save
        format.html do
          redirect_to parent_parent_attendance_view_url(@parent_parent_attendance_view),
                      notice: 'Parent attendance view was successfully created.'
        end
        format.json { render :show, status: :created, location: @parent_parent_attendance_view }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parent_parent_attendance_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parent/parent_attendance_views/1 or /parent/parent_attendance_views/1.json
  def update
    respond_to do |format|
      if @parent_parent_attendance_view.update(parent_parent_attendance_view_params)
        format.html do
          redirect_to parent_parent_attendance_view_url(@parent_parent_attendance_view),
                      notice: 'Parent attendance view was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @parent_parent_attendance_view }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parent_parent_attendance_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent/parent_attendance_views/1 or /parent/parent_attendance_views/1.json
  def destroy
    @parent_parent_attendance_view.destroy!

    respond_to do |format|
      format.html do
        redirect_to parent_parent_attendance_views_url, notice: 'Parent attendance view was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parent_parent_attendance_view
    @parent_parent_attendance_view = Parent::ParentAttendanceView.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def parent_parent_attendance_view_params
    params.require(:parent_parent_attendance_view).permit(:attendable_type, :attendable_id, :date, :status)
  end
end

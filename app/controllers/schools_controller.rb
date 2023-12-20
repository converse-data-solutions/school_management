# frozen_string_literal: true

# Controller responsible for handling School user actions in the admin section.
class SchoolsController < ApplicationController
  before_action :set_school, only: %i[edit update]

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit; end

  # POST /schools or /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to edit_school_url(@school), notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1 or /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to edit_school_url(@school), notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_school
    @school = School.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def school_params
    params.require(:school).permit(:school_name, :school_address1, :school_address2, :school_email, :school_phone,
                                   :academic_year, :image)
  end
end

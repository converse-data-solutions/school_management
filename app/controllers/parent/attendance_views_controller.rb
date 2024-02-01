# frozen_string_literal: true

# Parent::ParentNoticesController
class Parent::AttendanceViewsController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  include AuthorizationParentHelper
  # GET /parent/parent_attendance_views or /parent/parent_attendance_views.json
  def index
    @student_id = params[:student_id]
    @selected_date = params[:selected_date]
    @attendances = Attendance.where(attendable_id: @student_id, date: @selected_date)
    respond_to do |format|
      format.json { render json: @attendances }
      format.html { render :index }
    end
  end
end

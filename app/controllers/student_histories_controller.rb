# frozen_string_literal: true

# this is a controller for student history page
class StudentHistoriesController < ApplicationController
  include AuthorizationHelper
  before_action :check_admin_role
  def index
    @student_histories = StudentHistory.all

    respond_to do |format|
      format.html
      format.json { render json: StudentHistoryDatatable.new(params) }
    end
  end
end

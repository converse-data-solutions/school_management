class StudentHistoriesController < ApplicationController
  def index
    @student_histories = StudentHistory.all

    respond_to do |format|
      format.html
      format.json { render json: StudentHistoryDatatable.new(params) }
    end
  end
end

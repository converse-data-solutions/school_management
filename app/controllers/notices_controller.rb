# app/controllers/notices_controller.rb
class NoticesController < ApplicationController
  def index
    @parent_notice = Notice.new(notice_type: 'parent')
    @staff_notice = Notice.new(notice_type: 'staff')
    @parent_notices = Notice.where(notice_type: 'parent', notice_date: params.fetch(:date, Date.today))
    @staff_notices = Notice.where(notice_type: 'staff', notice_date: params.fetch(:date, Date.today))
    @selected_date = params.fetch(:date, Date.today)
  end

  def create
    existing_notice = find_existing_notice

    if existing_notice
      update_existing_notice(existing_notice)
    else
      create_new_notice
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to notices_path, notice: 'Notice deleted successfully.'
  end

  private

  def find_existing_notice
    Notice.find_by(notice_type: notice_params[:notice_type], notice_date: notice_params[:notice_date])
  end

  def update_existing_notice(existing_notice)
    existing_notice.update(notice_params)
    if existing_notice.valid?
      redirect_to notices_path, notice: 'Notice created successfully.'
    else
      redirect_to notices_path, alert: 'Failed to create notice.'
    end
  end

  def create_new_notice
    @notice = Notice.new(notice_params)
    if @notice.save
      redirect_to notices_path, notice: 'Notice created successfully.'
    else
      redirect_to notices_path, alert: 'Failed to create notice.'
    end
  end

  def notice_params
    params.require(:notice).permit(:notice_type, :notice, :notice_date, :user_id)
  end
end

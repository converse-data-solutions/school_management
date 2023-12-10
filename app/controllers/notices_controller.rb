# app/controllers/notices_controller.rb
class NoticesController < ApplicationController
  def index
    @parent_notice = Notice.new(notice_type: 'parent')
    @staff_notice = Notice.new(notice_type: 'staff')
    @parent_notices = Notice.where(notice_type: 'parent', notice_date: params.fetch(:date, Date.today))
    @staff_notices = Notice.where(notice_type: 'staff', notice_date: params.fetch(:date, Date.today))
    @selected_date = params.fetch(:date, Date.today)
  end

  def new_parent
    @notice = Notice.new(notice_type: 'parent')
    render 'new'
  end

  def new_staff
    @notice = Notice.new(notice_type: 'staff')
    render 'new'
  end

  def create
    @notice = Notice.new(notice_params) 
    if @notice.save
      redirect_to notices_path, notice: 'Notice created successfully.'
      flash[:notice] = 'Notice Created Successfully.'
    else
      redirect_to notices_path
      flash[:alert] = 'Please Enter The Notice.'
    end
  end

  def edit
    @notice = Notice.find(params[:id])
    render 'edit'
  end

  def update
    @notice = Notice.find(params[:id])

    if @notice.update(notice_params)
      redirect_to notices_path, notice: 'Notice updated successfully.'
    else
      render 'edit'
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:notice_type, :notice, :notice_date, :user_id)
  end
end


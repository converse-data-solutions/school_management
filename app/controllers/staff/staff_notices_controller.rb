class Staff::StaffNoticesController < ApplicationController
  # GET /staff/staff_notices or /staff/staff_notices.json
  def index
    @staff_notices = Notice.where(notice_type: 'staff', notice_date: Date.today)
  end
end

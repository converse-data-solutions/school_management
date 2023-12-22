# frozen_string_literal: true

# Parent::ParentNoticesController
class Staff::StaffNoticesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  # GET /staff/staff_notices or /staff/staff_notices.json
  def index
    @staff_notices = Notice.where(notice_type: 'staff', notice_date: Date.today)
  end
end

class Parent::ParentNoticesController < ApplicationController
  include AuthorizationParentHelper
  before_action :check_user_role, only: %i[index]
  # GET /parent/notices or /parent/notices.json
  def index
    @parent_notices = Notice.where(notice_type: 'parent', notice_date: Date.today)
  end
end

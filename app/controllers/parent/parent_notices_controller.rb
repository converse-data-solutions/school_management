# frozen_string_literal: true

# Parent::ParentNoticesController
class Parent::ParentNoticesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  include AuthorizationParentHelper
  before_action :check_user_role
  # GET /parent/notices or /parent/notices.json
  def index
    @parent_notices = Notice.where(notice_type: 'parent', notice_date: Date.today)
  end
end

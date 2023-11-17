require "test_helper"

class Admin::AdminUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_admin_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_admin_users_update_url
    assert_response :success
  end
end

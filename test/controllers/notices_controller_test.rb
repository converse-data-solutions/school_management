require "test_helper"

class NoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notices_index_url
    assert_response :success
  end

  test "should get new_parent" do
    get notices_new_parent_url
    assert_response :success
  end

  test "should get new_staff" do
    get notices_new_staff_url
    assert_response :success
  end

  test "should get create" do
    get notices_create_url
    assert_response :success
  end

  test "should get edit" do
    get notices_edit_url
    assert_response :success
  end

  test "should get update" do
    get notices_update_url
    assert_response :success
  end
end

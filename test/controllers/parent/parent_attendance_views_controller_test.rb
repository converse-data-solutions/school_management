require "test_helper"

class Parent::ParentAttendanceViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parent_parent_attendance_view = parent_parent_attendance_views(:one)
  end

  test "should get index" do
    get parent_parent_attendance_views_url
    assert_response :success
  end

  test "should get new" do
    get new_parent_parent_attendance_view_url
    assert_response :success
  end

  test "should create parent_parent_attendance_view" do
    assert_difference("Parent::ParentAttendanceView.count") do
      post parent_parent_attendance_views_url, params: { parent_parent_attendance_view: { attendable_id: @parent_parent_attendance_view.attendable_id, attendable_type: @parent_parent_attendance_view.attendable_type, date: @parent_parent_attendance_view.date, status: @parent_parent_attendance_view.status } }
    end

    assert_redirected_to parent_parent_attendance_view_url(Parent::ParentAttendanceView.last)
  end

  test "should show parent_parent_attendance_view" do
    get parent_parent_attendance_view_url(@parent_parent_attendance_view)
    assert_response :success
  end

  test "should get edit" do
    get edit_parent_parent_attendance_view_url(@parent_parent_attendance_view)
    assert_response :success
  end

  test "should update parent_parent_attendance_view" do
    patch parent_parent_attendance_view_url(@parent_parent_attendance_view), params: { parent_parent_attendance_view: { attendable_id: @parent_parent_attendance_view.attendable_id, attendable_type: @parent_parent_attendance_view.attendable_type, date: @parent_parent_attendance_view.date, status: @parent_parent_attendance_view.status } }
    assert_redirected_to parent_parent_attendance_view_url(@parent_parent_attendance_view)
  end

  test "should destroy parent_parent_attendance_view" do
    assert_difference("Parent::ParentAttendanceView.count", -1) do
      delete parent_parent_attendance_view_url(@parent_parent_attendance_view)
    end

    assert_redirected_to parent_parent_attendance_views_url
  end
end

require "test_helper"

class Staff::StaffAttendanceViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_staff_attendance_view = staff_staff_attendance_views(:one)
  end

  test "should get index" do
    get staff_staff_attendance_views_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_staff_attendance_view_url
    assert_response :success
  end

  test "should create staff_staff_attendance_view" do
    assert_difference("Staff::StaffAttendanceView.count") do
      post staff_staff_attendance_views_url, params: { staff_staff_attendance_view: { attendable_id: @staff_staff_attendance_view.attendable_id, attendable_type: @staff_staff_attendance_view.attendable_type, date: @staff_staff_attendance_view.date, status: @staff_staff_attendance_view.status } }
    end

    assert_redirected_to staff_staff_attendance_view_url(Staff::StaffAttendanceView.last)
  end

  test "should show staff_staff_attendance_view" do
    get staff_staff_attendance_view_url(@staff_staff_attendance_view)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_staff_attendance_view_url(@staff_staff_attendance_view)
    assert_response :success
  end

  test "should update staff_staff_attendance_view" do
    patch staff_staff_attendance_view_url(@staff_staff_attendance_view), params: { staff_staff_attendance_view: { attendable_id: @staff_staff_attendance_view.attendable_id, attendable_type: @staff_staff_attendance_view.attendable_type, date: @staff_staff_attendance_view.date, status: @staff_staff_attendance_view.status } }
    assert_redirected_to staff_staff_attendance_view_url(@staff_staff_attendance_view)
  end

  test "should destroy staff_staff_attendance_view" do
    assert_difference("Staff::StaffAttendanceView.count", -1) do
      delete staff_staff_attendance_view_url(@staff_staff_attendance_view)
    end

    assert_redirected_to staff_staff_attendance_views_url
  end
end

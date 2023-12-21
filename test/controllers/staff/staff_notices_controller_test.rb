require "test_helper"

class Staff::StaffNoticesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_staff_notice = staff_staff_notices(:one)
  end

  test "should get index" do
    get staff_staff_notices_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_staff_notice_url
    assert_response :success
  end

  test "should create staff_staff_notice" do
    assert_difference("Staff::StaffNotice.count") do
      post staff_staff_notices_url, params: { staff_staff_notice: {  } }
    end

    assert_redirected_to staff_staff_notice_url(Staff::StaffNotice.last)
  end

  test "should show staff_staff_notice" do
    get staff_staff_notice_url(@staff_staff_notice)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_staff_notice_url(@staff_staff_notice)
    assert_response :success
  end

  test "should update staff_staff_notice" do
    patch staff_staff_notice_url(@staff_staff_notice), params: { staff_staff_notice: {  } }
    assert_redirected_to staff_staff_notice_url(@staff_staff_notice)
  end

  test "should destroy staff_staff_notice" do
    assert_difference("Staff::StaffNotice.count", -1) do
      delete staff_staff_notice_url(@staff_staff_notice)
    end

    assert_redirected_to staff_staff_notices_url
  end
end

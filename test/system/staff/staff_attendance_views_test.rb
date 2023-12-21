require "application_system_test_case"

class Staff::StaffAttendanceViewsTest < ApplicationSystemTestCase
  setup do
    @staff_staff_attendance_view = staff_staff_attendance_views(:one)
  end

  test "visiting the index" do
    visit staff_staff_attendance_views_url
    assert_selector "h1", text: "Staff attendance views"
  end

  test "should create staff attendance view" do
    visit staff_staff_attendance_views_url
    click_on "New staff attendance view"

    fill_in "Attendable", with: @staff_staff_attendance_view.attendable_id
    fill_in "Attendable type", with: @staff_staff_attendance_view.attendable_type
    fill_in "Date", with: @staff_staff_attendance_view.date
    fill_in "Status", with: @staff_staff_attendance_view.status
    click_on "Create Staff attendance view"

    assert_text "Staff attendance view was successfully created"
    click_on "Back"
  end

  test "should update Staff attendance view" do
    visit staff_staff_attendance_view_url(@staff_staff_attendance_view)
    click_on "Edit this staff attendance view", match: :first

    fill_in "Attendable", with: @staff_staff_attendance_view.attendable_id
    fill_in "Attendable type", with: @staff_staff_attendance_view.attendable_type
    fill_in "Date", with: @staff_staff_attendance_view.date
    fill_in "Status", with: @staff_staff_attendance_view.status
    click_on "Update Staff attendance view"

    assert_text "Staff attendance view was successfully updated"
    click_on "Back"
  end

  test "should destroy Staff attendance view" do
    visit staff_staff_attendance_view_url(@staff_staff_attendance_view)
    click_on "Destroy this staff attendance view", match: :first

    assert_text "Staff attendance view was successfully destroyed"
  end
end

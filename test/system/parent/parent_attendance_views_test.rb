require "application_system_test_case"

class Parent::ParentAttendanceViewsTest < ApplicationSystemTestCase
  setup do
    @parent_parent_attendance_view = parent_parent_attendance_views(:one)
  end

  test "visiting the index" do
    visit parent_parent_attendance_views_url
    assert_selector "h1", text: "Parent attendance views"
  end

  test "should create parent attendance view" do
    visit parent_parent_attendance_views_url
    click_on "New parent attendance view"

    fill_in "Attendable", with: @parent_parent_attendance_view.attendable_id
    fill_in "Attendable type", with: @parent_parent_attendance_view.attendable_type
    fill_in "Date", with: @parent_parent_attendance_view.date
    fill_in "Status", with: @parent_parent_attendance_view.status
    click_on "Create Parent attendance view"

    assert_text "Parent attendance view was successfully created"
    click_on "Back"
  end

  test "should update Parent attendance view" do
    visit parent_parent_attendance_view_url(@parent_parent_attendance_view)
    click_on "Edit this parent attendance view", match: :first

    fill_in "Attendable", with: @parent_parent_attendance_view.attendable_id
    fill_in "Attendable type", with: @parent_parent_attendance_view.attendable_type
    fill_in "Date", with: @parent_parent_attendance_view.date
    fill_in "Status", with: @parent_parent_attendance_view.status
    click_on "Update Parent attendance view"

    assert_text "Parent attendance view was successfully updated"
    click_on "Back"
  end

  test "should destroy Parent attendance view" do
    visit parent_parent_attendance_view_url(@parent_parent_attendance_view)
    click_on "Destroy this parent attendance view", match: :first

    assert_text "Parent attendance view was successfully destroyed"
  end
end

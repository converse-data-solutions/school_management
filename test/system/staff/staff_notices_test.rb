require "application_system_test_case"

class Staff::StaffNoticesTest < ApplicationSystemTestCase
  setup do
    @staff_staff_notice = staff_staff_notices(:one)
  end

  test "visiting the index" do
    visit staff_staff_notices_url
    assert_selector "h1", text: "Staff notices"
  end

  test "should create staff notice" do
    visit staff_staff_notices_url
    click_on "New staff notice"

    click_on "Create Staff notice"

    assert_text "Staff notice was successfully created"
    click_on "Back"
  end

  test "should update Staff notice" do
    visit staff_staff_notice_url(@staff_staff_notice)
    click_on "Edit this staff notice", match: :first

    click_on "Update Staff notice"

    assert_text "Staff notice was successfully updated"
    click_on "Back"
  end

  test "should destroy Staff notice" do
    visit staff_staff_notice_url(@staff_staff_notice)
    click_on "Destroy this staff notice", match: :first

    assert_text "Staff notice was successfully destroyed"
  end
end

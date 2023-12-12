require "application_system_test_case"

class SchoolsTest < ApplicationSystemTestCase
  setup do
    @school = schools(:one)
  end

  test "visiting the index" do
    visit schools_url
    assert_selector "h1", text: "Schools"
  end

  test "should create school" do
    visit schools_url
    click_on "New school"

    fill_in "Academic year", with: @school.academic_year
    fill_in "School address1", with: @school.school_address1
    fill_in "School address2", with: @school.school_address2
    fill_in "School email", with: @school.school_email
    fill_in "School name", with: @school.school_name
    fill_in "School phone", with: @school.school_phone
    click_on "Create School"

    assert_text "School was successfully created"
    click_on "Back"
  end

  test "should update School" do
    visit school_url(@school)
    click_on "Edit this school", match: :first

    fill_in "Academic year", with: @school.academic_year
    fill_in "School address1", with: @school.school_address1
    fill_in "School address2", with: @school.school_address2
    fill_in "School email", with: @school.school_email
    fill_in "School name", with: @school.school_name
    fill_in "School phone", with: @school.school_phone
    click_on "Update School"

    assert_text "School was successfully updated"
    click_on "Back"
  end

  test "should destroy School" do
    visit school_url(@school)
    click_on "Destroy this school", match: :first

    assert_text "School was successfully destroyed"
  end
end

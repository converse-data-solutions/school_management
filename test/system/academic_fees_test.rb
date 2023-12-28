require "application_system_test_case"

class AcademicFeesTest < ApplicationSystemTestCase
  setup do
    @academic_fee = academic_fees(:one)
  end

  test "visiting the index" do
    visit academic_fees_url
    assert_selector "h1", text: "Academic fees"
  end

  test "should create academic fee" do
    visit academic_fees_url
    click_on "New academic fee"

    fill_in "Academic detail", with: @academic_fee.academic_detail_id
    fill_in "Actual fee", with: @academic_fee.actual_fee
    fill_in "Discount", with: @academic_fee.discount
    fill_in "Payable fee", with: @academic_fee.payable_fee
    click_on "Create Academic fee"

    assert_text "Academic fee was successfully created"
    click_on "Back"
  end

  test "should update Academic fee" do
    visit academic_fee_url(@academic_fee)
    click_on "Edit this academic fee", match: :first

    fill_in "Academic detail", with: @academic_fee.academic_detail_id
    fill_in "Actual fee", with: @academic_fee.actual_fee
    fill_in "Discount", with: @academic_fee.discount
    fill_in "Payable fee", with: @academic_fee.payable_fee
    click_on "Update Academic fee"

    assert_text "Academic fee was successfully updated"
    click_on "Back"
  end

  test "should destroy Academic fee" do
    visit academic_fee_url(@academic_fee)
    click_on "Destroy this academic fee", match: :first

    assert_text "Academic fee was successfully destroyed"
  end
end

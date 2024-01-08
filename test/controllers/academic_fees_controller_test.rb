require "test_helper"

class AcademicFeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_fee = academic_fees(:one)
  end

  test "should get index" do
    get academic_fees_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_fee_url
    assert_response :success
  end

  test "should create academic_fee" do
    assert_difference("AcademicFee.count") do
      post academic_fees_url, params: { academic_fee: { academic_detail_id: @academic_fee.academic_detail_id, actual_fee: @academic_fee.actual_fee, discount: @academic_fee.discount, payable_fee: @academic_fee.payable_fee } }
    end

    assert_redirected_to academic_fee_url(AcademicFee.last)
  end

  test "should show academic_fee" do
    get academic_fee_url(@academic_fee)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_fee_url(@academic_fee)
    assert_response :success
  end

  test "should update academic_fee" do
    patch academic_fee_url(@academic_fee), params: { academic_fee: { academic_detail_id: @academic_fee.academic_detail_id, actual_fee: @academic_fee.actual_fee, discount: @academic_fee.discount, payable_fee: @academic_fee.payable_fee } }
    assert_redirected_to academic_fee_url(@academic_fee)
  end

  test "should destroy academic_fee" do
    assert_difference("AcademicFee.count", -1) do
      delete academic_fee_url(@academic_fee)
    end

    assert_redirected_to academic_fees_url
  end
end

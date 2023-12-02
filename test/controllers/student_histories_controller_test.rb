require "test_helper"

class StudentHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_histories_index_url
    assert_response :success
  end
end

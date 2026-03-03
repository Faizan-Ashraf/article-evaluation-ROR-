require "test_helper"

class Competitor::SubmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get competitor_submissions_new_url
    assert_response :success
  end

  test "should get create" do
    get competitor_submissions_create_url
    assert_response :success
  end

  test "should get index" do
    get competitor_submissions_index_url
    assert_response :success
  end
end

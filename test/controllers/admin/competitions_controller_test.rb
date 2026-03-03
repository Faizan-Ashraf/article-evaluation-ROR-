require "test_helper"

class Admin::CompetitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_competitions_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_competitions_create_url
    assert_response :success
  end

  test "should get submissions" do
    get admin_competitions_submissions_url
    assert_response :success
  end

  test "should get evaluate" do
    get admin_competitions_evaluate_url
    assert_response :success
  end
end

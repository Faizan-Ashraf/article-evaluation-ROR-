require "test_helper"

class Admin::SubmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_submissions_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_submissions_update_url
    assert_response :success
  end
end

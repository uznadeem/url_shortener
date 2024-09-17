require "test_helper"

class RedirectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get redirections_new_url
    assert_response :success
  end

  test "should get create" do
    get redirections_create_url
    assert_response :success
  end

  test "should get show" do
    get redirections_show_url
    assert_response :success
  end
end

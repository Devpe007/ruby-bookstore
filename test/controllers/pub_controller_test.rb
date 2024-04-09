require "test_helper"

class PubControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pub_index_url
    assert_response :success
  end

  test "should get sobre" do
    get pub_sobre_url
    assert_response :success
  end
end

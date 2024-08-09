require "test_helper"

class ModesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get modes_index_url
    assert_response :success
  end

  test "should get show" do
    get modes_show_url
    assert_response :success
  end
end

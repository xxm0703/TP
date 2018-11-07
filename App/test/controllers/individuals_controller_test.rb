require 'test_helper'

class IndividualsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get individuals_create_url
    assert_response :success
  end

  test "should get show" do
    get individuals_show_url
    assert_response :success
  end

  test "should get index" do
    get individuals_index_url
    assert_response :success
  end

end

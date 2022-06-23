require "test_helper"

class BeerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get beer_new_url
    assert_response :success
  end

  test "should get create" do
    get beer_create_url
    assert_response :success
  end
end

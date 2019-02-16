require 'test_helper'

class BrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brands_url
    assert_response :success
  end

  test "should show brand by name" do
    get brand_url(id: brands(:shoyeido).id)
    assert_response :success
  end

  test "should error if brand cannot be found" do
    get brand_url(id: 9)
    assert_equal response.body, "{\"status\":400,\"message\":\"brand not found\"}"
  end

  test "should approve unapproved brand" do
    patch "/brands/2/approve"
    assert_response :success
  end

  test "should not approve approved brand" do
    patch "/brands/1/approve"
    assert_equal response.body, "{\"status\":400,\"message\":\"Brand shoyeido already approved\"}"
  end
end

require 'test_helper'

class BrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brands_url
    assert_response :success
  end

  test "should show brand by name" do
    get brand_url(name: brands(:shoyeido).name)
    assert_response :success
  end

  test "should approve unapproved brand" do
    patch "/brand/baieido/approve"
    assert_response :success
  end

  test "should not approve approved brand" do
    patch "/brand/shoyeido/approve"
    assert_equal response.body, "{\"status\":400,\"message\":\"Brand shoyeido already approved\"}"
  end
end

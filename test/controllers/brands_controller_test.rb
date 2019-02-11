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
    get brand_url(name: brands(:baieido).name)
    assert_response :success
  end

  test "should not approve approved brand" do
    get brand_url(name: brands(:shoyeido).name)
    assert_response :error
  end
end

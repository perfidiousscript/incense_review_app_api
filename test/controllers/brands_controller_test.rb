require 'test_helper'

class BrandsControllerTest < ActionDispatch::IntegrationTest
  unapproved_brands = "{\"status\":200,\"brands\":[{\"id\":2,\"name\":\"baieido\",\"country\":\"Japan\",\"approved\":null,\"description\":\"Very expensive.\"},{\"id\":3,\"name\":\"nippon kodo\",\"country\":\"Japan\",\"approved\":null,\"description\":\"Very cheap.\"}]}"

  test "should get index" do
    get brands_url
    assert_response :success
  end

  test "index_unapproved_brands should index unapproved brand(s)" do
    get index_unapproved_brands_url
    assert_equal response.body, unapproved_brands
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

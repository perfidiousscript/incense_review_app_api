require 'test_helper'

class LinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brand_lines_url(brand_name: brands(:shoyeido).name)
    assert_response :success
  end

  test "should show line by name" do
    get brand_line_url(brand_name: brands(:shoyeido).name, name: lines(:daily).name)
    assert_response :success
  end

  test "should approve unapproved line" do
    patch brand_line_approve_url(brand_name: brands(:shoyeido).name, line_name: lines(:horin).name)
    assert_response :success
  end

  test "should not approve approved line" do
    patch brand_line_approve_url(brand_name: brands(:shoyeido).name, line_name: lines(:daily).name)
    assert_equal response.body, "{\"status\":400,\"error\":\"Line daily already approved\"}"
  end
end

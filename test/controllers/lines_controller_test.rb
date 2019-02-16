require 'test_helper'

class LinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brand_lines_url(brand_id: brands(:shoyeido).id)
    assert_response :success
  end

  test "should show line by name" do
    get line_url(brand_id: brands(:shoyeido).id, id: lines(:daily).id)
    assert_response :success
  end

  test "should error if line cannot be found" do
    get line_url(brand_id: brands(:shoyeido).id, id: 9)
    assert_equal response.body, "{\"status\":400,\"message\":\"line not found\"}"
  end

  test "should approve unapproved line" do
    patch approve_line_url(id: lines(:horin).id)
    assert_response :success
  end

  test "should not approve approved line" do
    patch approve_line_url(id: lines(:daily).id)
    assert_equal response.body, "{\"status\":400,\"error\":\"Line daily already approved\"}"
  end
end

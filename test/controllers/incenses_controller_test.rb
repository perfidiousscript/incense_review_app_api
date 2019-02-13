require 'test_helper'

class IncensesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brand_line_incenses_url(brand_name: brands(:shoyeido).name, line_name: lines(:daily).name)
    assert_response :success
  end

  test "should show incense by name" do
    get brand_line_incense_url(brand_name: brands(:shoyeido).name, line_name: lines(:daily).name, name: incenses(:golden_pavilion).name)
    assert_response :success
  end

  test "should error if incense cannot be found" do
    get brand_line_incense_url(brand_name: brands(:shoyeido).name, line_name: lines(:daily).name, name: "snergle")
    assert_equal response.body, "{\"status\":400,\"message\":\"Incense not found\"}"
  end

end

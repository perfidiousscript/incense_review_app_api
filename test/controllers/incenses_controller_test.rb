require 'test_helper'

class IncensesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get line_incenses_url(line_id: lines(:daily).id)
    assert_response :success
  end

  test "should show incense by name" do
    get incense_url(id: incenses(:golden_pavilion).id)
    assert_response :success
  end

  test "should error if incense cannot be found" do
    get incense_url(id: 9)
    assert_equal response.body, "{\"status\":400,\"message\":\"Incense not found\"}"
  end

end

require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get incense_reviews_url(incense_id: incenses(:golden_pavilion).id)
    assert_response :success
  end

  test "should show review" do
    get review_url(id: reviews(:review_1).id)
    assert_response :success
  end

  test "should error if review cannot be found" do
    get review_url(id: 9)
    assert_equal response.body, "{\"status\":400,\"message\":\"Review not found\"}"
  end
end

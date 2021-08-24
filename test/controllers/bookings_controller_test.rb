require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  test "should get new" do
    get bookings_new_url
    assert_response :success
  end
>>>>>>> master
end

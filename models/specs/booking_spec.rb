require("minitest/autorun")
require_relative("../booking")

class TestBooking < MiniTest::Test

  def setup
    options = {"id" => 1,
      "yogaclass_id" => 2,
      "member_id" => 3
    }
    @booking = Booking.new(options)
  end

  def test_member_id()
    assert_equal(3, @booking.member_id())
  end

  def test_yogaclass_id()
    assert_equal(2, @booking.yogaclass_id())
  end

end

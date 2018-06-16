require("minitest/autorun")
require_relative("../instructor")

class TestInstructor < MiniTest::Test

  def setup
    options = {"id" => 1,
      "first_name" => "Amanda",
      "last_name" => "Coates",
      "speciality" => "Yin"
    }
    @instructor = Instructor.new(options)
  end

  def test_first_name()
    assert_equal("Amanda", @instructor.first_name())
  end

  def test_last_name()
    assert_equal("Coates", @instructor.last_name())
  end

  def test_speciality()
    assert_equal("Yin", @instructor.speciality())
  end

end

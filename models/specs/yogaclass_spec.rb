require("minitest/autorun")
require_relative("../yogaclass")

class TestYogaClass < MiniTest::Test

  def setup
    options ={
        "id" => 1,
        "name" => "Power Flow",
        "start_time" => "2018-01-01 12:00",
        "duration" => "1 Hour",
        "level" => "Beginner",
        "instructor_id" => 3
      }
    @yogaclass = YogaClass.new(options)
  end

  def test_name()
    assert_equal("Power Flow", @yogaclass.name())
  end

  def test_time()
    assert_equal("2018-01-01 12:00", @yogaclass.start_time())
  end

  def test_duration()
    assert_equal("1 Hour", @yogaclass.duration())
  end

  def test_level()
    assert_equal("Beginner", @yogaclass.level())
  end

  def test_instructor_id()
    assert_equal(3, @yogaclass.instructor_id())
  end

end

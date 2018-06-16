require("minitest/autorun")
require_relative("../member")

class TestMember < MiniTest::Test

  def setup
    options = {"id" => 1,
      "first_name" => "Michelle",
      "last_name" => "Brown",
      "level" => "Beginner"
    }
    @member = Member.new(options)
  end

  def test_first_name()
    assert_equal("Michelle", @member.first_name())
  end

  def test_last_name()
    assert_equal("Brown", @member.last_name())
  end

  def test_speciality()
    assert_equal("Beginner", @member.level())
  end

end

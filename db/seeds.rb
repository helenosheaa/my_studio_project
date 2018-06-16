require_relative( "../models/booking.rb" )
require_relative( "../models/instructor.rb" )
require_relative( "../models/yogaclass.rb" )
require("pry-byebug")

instructor1 = Instructor.new({
  "name" => "Stacy",
  "speciality" => "Ashtanga"
})

instructor2 = Instructor.new({
  "name" => "Amanda",
  "speciality" => "Yin"
})

instructor3 = Instructor.new({
  "name" => "Cat",
  "speciality" => "Power"
})

yogaclass1 = YogaClass.new({
  "name" => "Fully-led Ashtanga",
  "time" => "09:00",
  "duration" => "1.5 Hours",
  "level" => "Advanced",
  "instructor_id" => instructor1.id
})

yogaclass2 = YogaClass.new({
  "name" => "Yin Yoga",
  "time" => "17:00",
  "duration" => "1 Hour",
  "level" => "Intermediate",
  "instructor_id" => instructor2.id
})

yogaclass3 = YogaClass.new({
  "name" => "Power Flow",
  "time" => "12:00",
  "duration" => "1 Hour",
  "level" => "Beginner",
  "instructor_id" => instructor3.id
})

yogaclass3 = YogaClass.new({
  "name" => "Power Flow",
  "time" => "12:00",
  "duration" => "1 Hour",
  "level" => "Beginner",
  "instructor_id" => instructor3.id
})

member1 = Member.new({
  "first_name" => "Michelle",
  "last_name" => "Brown",
  "level" => "Beginner"
})

member2 = Member.new({
  "first_name" => "John",
  "last_name" => "Dimaro",
  "level" => "Intermediate"
})

member3 = Member.new({
  "first_name" => "Christine",
  "last_name" => "Clapham",
  "level" => "Advanced"
})

booking1 = Booking.new({
  "member_id" => member1.id,
  "yogaclass_id" => yogaclass1.id
})

booking2 = Booking.new({
  "member_id" => member2.id,
  "yogaclass_id" => yogaclass2.id
})

booking3 = Booking.new({
  "member_id" => member2.id,
  "yogaclass_id" => yogaclass3.id
})



binding.pry
nil

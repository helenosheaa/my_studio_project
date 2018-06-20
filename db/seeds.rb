require_relative( "../models/booking.rb" )
require_relative( "../models/instructor.rb" )
require_relative( "../models/yogaclass.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/level.rb" )
require_relative( "../models/speciality.rb" )
require("pry-byebug")

Booking.delete_all()
Member.delete_all()
YogaClass.delete_all()
Instructor.delete_all()
Speciality.delete_all()
Level.delete_all()

level1 = Level.new({
  "level" => "Beginner"
})
level1.save()

level2 = Level.new({
  "level" => "Intermediate"
})
level2.save()

level3 = Level.new({
  "level" => "Advanced"
})
level3.save()

speciality1 = Speciality.new({
  "speciality" => "Ashtanga"
})
speciality1.save()

speciality2 = Speciality.new({
  "speciality" => "Yin"
})
speciality2.save()

speciality3 = Speciality.new({
  "speciality" => "Power Flow"
})
speciality3.save()

speciality4 = Speciality.new({
  "speciality" => "Vinyasa Flow"
})
speciality4.save()

speciality5 = Speciality.new({
  "speciality" => "Restorative"
})
speciality5.save()

instructor1 = Instructor.new({
  "first_name" => "Stacy",
  "last_name" => "Hardy",
  "speciality_id" => speciality1.id
})
instructor1.save()

instructor2 = Instructor.new({
  "first_name" => "Amanda",
  "last_name" => "Coates",
  "speciality_id" => speciality2.id
})
instructor2.save()

instructor3 = Instructor.new({
  "first_name" => "Cat",
  "last_name" => "Johnstone",
  "speciality_id" => speciality3.id
})
instructor3.save()

instructor4 = Instructor.new({
  "first_name" => "Joy",
  "last_name" => "Stafford",
  "speciality_id" => speciality4.id
})
instructor4.save()

instructor5 = Instructor.new({
  "first_name" => "Brittany",
  "last_name" => "Holt",
  "speciality_id" => speciality5.id
})
instructor5.save()

yogaclass1 = YogaClass.new({
  "name" => "Fully-led Ashtanga",
  "start_time" => "2018-01-01 09:00",
  "duration" => "1 Hour 30 Minutes",
  "capacity" => 20,
  "level_id" => level3.id,
  "instructor_id" => instructor1.id
})
yogaclass1.save()

yogaclass2 = YogaClass.new({
  "name" => "Yin Yoga",
  "start_time" => "2018-01-01 18:30",
  "duration" => "1 Hour",
  "capacity" => 20,
  "level_id" => level2.id,
  "instructor_id" => instructor2.id
})
yogaclass2.save()

yogaclass3 = YogaClass.new({
  "name" => "Power Flow",
  "start_time" => "2018-01-01 17:00",
  "duration" => "45 Minutes",
  "capacity" => 20,
  "level_id" => level3.id,
  "instructor_id" => instructor3.id
})
yogaclass3.save()

yogaclass4 = YogaClass.new({
  "name" => "Vinyasa Flow",
  "start_time" => "2018-01-01 12:00",
  "duration" => "1 Hour",
  "capacity" => 20,
  "level_id" => level2.id,
  "instructor_id" => instructor4.id
})
yogaclass4.save()

yogaclass5 = YogaClass.new({
  "name" => "Restorative",
  "start_time" => "2018-01-01 20:00",
  "duration" => "1 Hour 15 Minutes",
  "capacity" => 20,
  "level_id" => level1.id,
  "instructor_id" => instructor5.id
})
yogaclass5.save()

member1 = Member.new({
  "first_name" => "Michelle",
  "last_name" => "Brown",
  "level_id" => level1.id
})
member1.save()

member2 = Member.new({
  "first_name" => "John",
  "last_name" => "Dimaro",
  "level_id" => level2.id
})
member2.save()

member3 = Member.new({
  "first_name" => "Christine",
  "last_name" => "Clapham",
  "level_id" => level3.id
})
member3.save()

member4 = Member.new({
  "first_name" => "Kerry",
  "last_name" => "Segel",
  "level_id" => level3.id
})
member4.save()

member5 = Member.new({
  "first_name" => "Jane",
  "last_name" => "Jeffries",
  "level_id" => level3.id
})
member5.save()

booking1 = Booking.new({
  "member_id" => member1.id,
  "yogaclass_id" => yogaclass1.id
})
booking1.save()

booking2 = Booking.new({
  "member_id" => member2.id,
  "yogaclass_id" => yogaclass2.id
})
booking2.save()

booking3 = Booking.new({
  "member_id" => member3.id,
  "yogaclass_id" => yogaclass3.id
})
booking3.save()

booking4 = Booking.new({
  "member_id" => member4.id,
  "yogaclass_id" => yogaclass4.id
})
booking4.save()

booking5 = Booking.new({
  "member_id" => member5.id,
  "yogaclass_id" => yogaclass5.id
})
booking3.save()


binding.pry
nil

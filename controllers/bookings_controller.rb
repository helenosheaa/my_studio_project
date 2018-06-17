require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/booking.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/yogaclass.rb' )
require_relative( '../models/instructor.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all()
  erb ( :"bookings/index" )
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'].to_i)
  erb( :"bookings/show" )
end

get '/bookings/new' do
  @members = Member.all
  @yogaclasses = YogaClass.all
  erb(:"bookings/new")
end

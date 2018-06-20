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

get '/bookings/new' do
  @members = Member.all
  @yogaclasses = YogaClass.all
  erb(:"bookings/new")
end

get '/bookings/error' do
  erb(:"bookings/error")
end

post '/bookings' do
  yogaclass = YogaClass.find(params['yogaclass_id'])
  if !yogaclass.is_full?
    yogaclass.add_participant()
    Booking.new(params).save
    redirect to ( "/bookings" )
  else
    redirect to ("/bookings/error")
  end
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'].to_i)
  @bookings = Booking.all()
  erb( :"bookings/show" )
end

get '/bookings/:id/edit' do
  @members = Member.all
  @yogaclasses = YogaClass.all
  @booking = Booking.find(params['id'])
  erb(:"bookings/edit")
end

post '/bookings/:id' do
  booking = Booking.new(params)
  booking.update()
  redirect to ("/bookings")
end

post '/bookings/:id/delete' do
  Booking.destroy(params[:id].to_i)
  redirect to ("/bookings")
end

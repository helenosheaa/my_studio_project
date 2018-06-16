require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/bookings_controller')
require_relative('controllers/instructors_controller')
require_relative('controllers/members_controller')
require_relative('controllers/yogaclasses_controller')

get '/' do
  erb( :index )
end

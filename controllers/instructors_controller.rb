require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/instructor.rb' )
also_reload( '../models/*' )

get '/instructors' do
  @instructors = Instructor.all()
  erb ( :"instructors/index" )
end

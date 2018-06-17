require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/yogaclass.rb' )
require_relative( '../models/instructor.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/yogaclasses' do
  @yogaclasses = YogaClass.all()
  erb ( :"yogaclasses/index" )
end

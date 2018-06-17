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

get '/yogaclasses/:id' do
  @yogaclass = YogaClass.find(params['id'].to_i)
  erb( :"yogaclasses/show" )
end

get '/yogaclasses/new' do
  @yogaclasses = YogaClass.all
  erb( :new )
end

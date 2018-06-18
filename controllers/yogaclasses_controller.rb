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

get '/yogaclasses/new' do
  @instructors = Instructor.all()
  @yogaclasses = YogaClass.all()
  erb( :"yogaclasses/new" )
end

post '/yogaclasses' do
  YogaClass.new(params).save
  redirect to ( "/yogaclasses" )
end

get '/yogaclasses/:id' do
  @yogaclass = YogaClass.find(params['id'].to_i)
  erb( :"yogaclasses/show" )
end


get '/yogaclasses/:id/edit' do
  @yogaclass = YogaClass.find(params['id'].to_i)
  erb(:"yogaclasses/edit")
end

post '/yogaclasses/:id' do
  yogaclass = YogaClass.new(params)
  yogaclass.update
  redirect to ("/yogaclasses/#{params['id']}")
end

post '/yogaclasses/:id/delete' do
  YogaClass.destroy(params[:id].to_i)
  redirect to ("/yogaclasses")
end

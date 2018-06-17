require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/instructor.rb' )
require_relative( '../models/yogaclass.rb' )
also_reload( '../models/*' )

get '/instructors' do
  @instructors = Instructor.all()
  erb ( :"instructors/index" )
end

get '/instructors/new' do
  @instructors = Instructor.all
  erb( :"instructors/new" )
end

post '/instructors' do
  Instructor.new(params).save
  redirect to ( "/instructors" )
end

get '/instructors/:id' do
  @instructor = Instructor.find(params['id'].to_i)
  erb( :"instructors/show" )
end

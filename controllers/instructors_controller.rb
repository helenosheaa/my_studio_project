require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/instructor.rb' )
require_relative( '../models/speciality.rb' )
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
  @instructors = Instructor.all()
  erb( :"instructors/show" )
end

get '/instructors/:id/edit' do
  @specialities = Speciality.all()
  @instructor = Instructor.find(params['id'].to_i)
  erb(:"instructors/edit")
end

post '/instructors/:id' do
  instructor = Instructor.new(params)
  instructor.update
  redirect to ("/instructors")
end

post '/instructors/:id/delete' do
  Instructor.destroy(params[:id].to_i)
  redirect to ("/instructors")
end

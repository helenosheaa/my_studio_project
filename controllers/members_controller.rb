require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
require_relative( '../models/level.rb' )
also_reload( '../models/*' )

get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members/new' do
  @members = Member.all
  erb( :"members/new" )
end

post '/members' do
  Member.new(params).save
  redirect to ( "/members" )
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  erb( :"members/show" )
end


get '/members/:id/edit' do
  @levels = Level.all()
  @member = Member.find(params['id'].to_i)
  erb(:"members/edit")
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to ("/members")
end

post '/members/:id/delete' do
  Member.destroy(params[:id].to_i)
  redirect to ("/members")
end

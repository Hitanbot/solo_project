require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/player.rb' )
also_reload( '../models/*' )

get '/players' do
  @players = Player.all()
  erb ( :"player/index" )
end



get '/players/new' do
  erb(:"player/new")
end

post '/players' do
  @player= Player.new(params)
  @player.save()
  redirect to ('/players')
end

get '/players/:id/edit' do
  @player = Player.find(params['id'])
  erb (:"player/edit")
end

get '/players/:id' do
  @player = Player.find(params['id'].to_i)
  erb( :"player/show" )
end

post '/players/:id/delete' do
  Player.destroy(params['id'].to_i)
  redirect to ('/players')
end

post '/players/:id' do
  player = Player.new(params)
  player.update
  redirect to ('/players')
end

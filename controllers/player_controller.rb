require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/player.rb' )
also_reload( '../models/*' )

get '/players' do
  @players = Player.all()
  erb ( :"player/index" )
end

get '/players/:id' do
  @player = Player.find(params['id'].to_i)
  erb( :"player/show" )
end

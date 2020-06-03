require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/campaign_controller')
require_relative('controllers/player_controller')
require_relative('controllers/character_controller')


get '/' do
  erb( :index )
end

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/character.rb' )
require_relative( '../models/player.rb' )
require_relative( '../models/campaign.rb' )
require_relative( '../models/item.rb' )
also_reload( '../models/*' )


get '/characters' do
  @characters = Character.all()
  erb ( :"character/index" )
end

get '/characters/:id' do
  @character = Character.find(params['id'].to_i)
  erb( :"character/show" )
end

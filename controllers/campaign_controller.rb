require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/campaign.rb' )
require_relative( '../models/character.rb' )
require_relative( '../models/player.rb' )
require_relative( '../models/item.rb' )
also_reload( '../models/*' )

get '/campaigns' do
  @campaigns = Campaign.all()
  erb ( :"campaign/index" )
end

get '/campaigns/:id' do
  @campaign = Campaign.find(params['id'].to_i)
  erb(:"campaign/show")
end

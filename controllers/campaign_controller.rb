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

get '/campaigns/new' do
  erb (:"campaign/new")
end

post '/campaigns' do
  @campaign= Campaign.new(params)
  @campaign.save()
  redirect to ('/campaigns')
end

get '/campaigns/:id/edit' do
  @campaign = Campaign.find(params['id'])
  erb (:"campaign/edit")
end

get '/campaigns/:id' do
  @campaign = Campaign.find(params['id'].to_i)
  erb(:"campaign/show")
end

post '/campaigns/:id/delete' do
  Campaign.destroy(params['id'].to_i)
  redirect to ('/campaigns')
end

post '/campaigns/:id' do
  campaign = Campaign.new(params)
  campaign.update
  redirect to ('/campaigns')
end

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

get '/characters/new' do
  @campaigns=Campaign.all
  @players=Player.all
  erb (:"character/new")
end

post '/characters' do
  @character= Character.new(params)
  @character.save()
  redirect to ('/characters')
end

get '/characters/:id/edit' do
  @campaigns=Campaign.all
  @players=Player.all
  @character = Character.find(params['id'])
  erb (:"character/edit")
end


get '/characters/:id' do
  @character = Character.find(params['id'].to_i)
  erb( :"character/show" )
end



post '/characters/:id/delete' do
  Character.destroy(params['id'].to_i)
  redirect to ('/characters')
end

post '/characters/:id' do
  character = Character.new(params)
  character.update
  redirect to ('/characters')
end

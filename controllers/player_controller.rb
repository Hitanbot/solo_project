require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/character.rb' )
require_relative( '../models/player.rb' )
require_relative( '../models/campaign.rb' )
require_relative( '../models/item.rb' )
also_reload( '../models/*' )
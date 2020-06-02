require_relative( "../models/campaign.rb" )
require_relative( "../models/player.rb" )
require_relative( "../models/character.rb" )
require("pry-byebug")

character.delete_all()
campaign.delete_all()
player.delete_all()

campaign1 = Campaign.new({
  "name" => "Romero",
  "type" => "Generic"
})

campaign1.save()

campaign2 = Campaign.new({
  "name" => "Raimi",
  "type" => "Deadite"
})

campaign2.save()

campaign3 = Campaign.new({
  "name" => "Boyle",
  "type" => "Runner"
})

campaign3.save()

campaign4 = Campaign.new({
  "name" => "Newell",
  "type" => "Boomer"
})

campaign4.save()

player1 = Player.new({
  "name" => "Maggie",
  "run_speed" => 12
})

player1.save()

player2 = Player.new({
  "name" => "Rick",
  "run_speed" => 11
})

player2.save()

player3 = Player.new({
  "name" => "Michonne",
  "run_speed" => 15
})

player3.save()

player4 = Player.new({
  "name" => "Glenn",
  "run_speed" => 30
})

player4.save()

character1 = Character.new({
  "player_id" => player1.id,
  "campaign_id" => campaign1.id
})

character1.save()

character2 = Character.new({
  "player_id" => player2.id,
  "campaign_id" => campaign2.id
})

character2.save()

character3 = Character.new({
  "player_id" => player3.id,
  "campaign_id" => campaign4.id
})
character3.save()

character4 = Character.new({
  "player_id" => player3.id,
  "campaign_id" => campaign1.id
})

character4.save()

binding.pry
nil

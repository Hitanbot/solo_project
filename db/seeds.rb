require_relative( "../models/campaign.rb" )
require_relative( "../models/player.rb" )
require_relative( "../models/character.rb" )
require("pry-byebug")

Character.delete_all()
Campaign.delete_all()
Player.delete_all()

campaign1 = Campaign.new({
  "name" => "Monster Hunters",
  "setting" => "Unexplored Jungle",
  "schedule" => "1900 to 2300 Sunday"
})

campaign1.save()

campaign2 = Campaign.new({
  "name" => "Gladiators",
  "setting" => "Underground fighting Arena",
  "schedule" => "1600 to 1800  Saturday"
})

campaign2.save()

campaign3 = Campaign.new({
  "name" => "Running in the shadows",
  "setting" => "Cairo, Mega city",
  "schedule" => "1000 to 1300  Saturday"
})

campaign3.save()

campaign4 = Campaign.new({
  "name" => "Forgotten Memories",
  "setting" => "Mysterious forest",
  "schedule" => "1800 to 2100  Wednesday"
})

campaign4.save()

player1 = Player.new({
  "name" => "Maggie",
  "games_played" => 12
})

player1.save()

player2 = Player.new({
  "name" => "Tom",
  "games_played" => 2
})

player2.save()

player3 = Player.new({
  "name" => "Adam",
  "games_played" => 15
})

player3.save()

player4 = Player.new({
  "name" => "Glenn",
  "games_played" => 8
})

player4.save()

character1 = Character.new({
  "name" => "Fang",
  "race" => "Shifter",
  "class" => "Barbarian",
  "level" => 11,
  "player_id" => player1.id,
  "campaign_id" => campaign1.id
})

character1.save()

character2 = Character.new({
  "name" => "Cor",
  "race" => "Aasimar",
  "class" => "Bard",
  "level" => 9,
  "player_id" => player1.id,
  "campaign_id" => campaign1.id
})

character2.save()

character3 = Character.new({
  "name" => "Galian Bungler",
  "race" => "Gnome",
  "class" => "Wizard",
  "level" => 3,
  "player_id" => player1.id,
  "campaign_id" => campaign1.id
})
character3.save()

character4 = Character.new({
  "name" => "Willow",
  "race" => "Human",
  "class" => "Druid",
  "level" => 5,
  "player_id" => player1.id,
  "campaign_id" => campaign1.id
})

character4.save()

binding.pry
nil

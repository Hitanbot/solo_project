DROP TABLE campaigns;
DROP TABLE players;
DROP TABLE characters;
DROP TABLE items;


CREATE TABLE campaigns
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  setting VARCHAR(255),
  schedule VARCHAR(255)
);

CREATE TABLE players
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  games_played INT
);

CREATE TABLE characters
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  race VARCHAR(255),
  class VARCHAR(255),
  level INT,
  campaign_id INT references campaigns(id),
  player_id INT references players(id)
);

CREATE TABLE items
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  effect VARCHAR(255),
  character_id INT references characters(id)
);

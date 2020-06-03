DROP TABLE campaigns CASCADE;
DROP TABLE players CASCADE;
DROP TABLE characters CASCADE;
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
  campaign_id INT references campaigns(id) ON DELETE CASCADE,
  player_id INT references players(id) ON DELETE CASCADE
);

CREATE TABLE items
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  effect VARCHAR(255),
  character_id INT references characters(id) ON DELETE CASCADE
);

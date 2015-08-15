-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Check if database already exists and drop if it does
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;

-- Connect to database
\c tournament

-- Create players table: table will consist of Player IDs and Names
CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name varchar(255)
);

-- Create match table: table will consist of all matches in tournament
CREATE TABLE Match_List (
  match_id SERIAL PRIMARY KEY,
  winner int references players(id),
  loser int references players(id)
);

-- Create Win_List view: list player ids and no. of wins
CREATE VIEW Win_Count AS
  SELECT players.id, COUNT(Match_List.winner) AS wins
  FROM players
  LEFT JOIN Match_List
  ON players.id = Match_List.winner
  GROUP BY players.id
  ORDER BY wins DESC;

-- Create Match_Count view: list player ids and no. of matches
CREATE VIEW Match_Count AS
  SELECT players.id, COUNT(Match_List.match_id) AS matches
  FROM players
  LEFT JOIN Match_List
  ON players.id = winner or players.id = loser
  GROUP BY players.id
  ORDER BY matches DESC;

-- Create Standings view: list no. of wins and mathces for all players
CREATE VIEW Standings AS
  SELECT players.id, players.name, Win_Count.wins as wins,
  Match_Count.matches as matches
  FROM players, Win_Count, Match_Count
  WHERE players.id = Win_Count.id and Win_Count.id = Match_Count.id;

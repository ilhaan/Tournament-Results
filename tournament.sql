-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- if Standings view exists, drop it
DROP VIEW IF EXISTS Standings;

-- if Match_Count view exists, drop it
DROP VIEW IF EXISTS Match_Count;

-- if Win_Count view exists, drop it
DROP VIEW IF EXISTS Win_Count;

-- if Match_List table exists, drop it
DROP TABLE IF EXISTS Match_List;

-- if players table exists, drop it
DROP TABLE IF EXISTS players;

-- Create players table
CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name varchar(255)
);

-- Create match table
CREATE TABLE Match_List (
  player int references players(id),
  opponent int references players(id),
  result int -- 0: player loses & opp wins, 1: player wins & opp loses
);

-- Create Win_Count view
CREATE VIEW Win_Count AS
  SELECT players.id, COUNT(Matches.opponent) AS wins
  FROM players
  LEFT JOIN (SELECT * FROM Match_List WHERE result>0) as Matches
  ON players.id = Matches.player
  GROUP BY players.id;

-- Create Match_Count view
CREATE VIEW Match_Count AS
  SELECT players.id, COUNT(Match_List.opponent) AS matches
  FROM players
  LEFT JOIN Match_List
  ON players.id = Match_List.player
  GROUP BY players.id;

-- Create Standings view
CREATE VIEW Standings AS
  SELECT players.id, players.name, Win_Count.wins as wins, Match_Count.matches as matches
  FROM players, Win_Count, Match_Count
  WHERE players.id = Win_Count.id and Win_Count.id = Match_Count.id;

# Tournament-Results

This repository consists of my work for Project 2 of [Udacity's Full Stack Web Developer Nanodegree](https://www.udacity.com/course/full-stack-web-developer-nanodegree--nd004).

## Scripts
The repostiory consists of the following scripts:

1.  `tournament.py`
2.  `tournament.sql`
3.  `tournament_test.py`

## Requirements

The project requires the following:

* [Python](https://www.python.org/)
* [PostgreSQL](http://www.postgresql.org/download/)

If you are unable to install either of the packages above, you may follow the instructions shown [here](https://docs.google.com/document/d/16IgOm4XprTaKxAa8w02y028oBECOoB1EI1ReddADEeY/pub?embedded=true) to set up the Vagrant VM from Udacity that was used to create and test the scripts in this repostiory.

## Instructions

Once you have cloned this repository and installed all the required software packages, follow the instructions listed below to test this project:

1. Change your working directory to the cloned repository: `cd (path-to-cloned-repo)/Tournament-Results`
2. Create the 'tournament' database: `psql -c "create database tournament;"`
3. Connect psql to the 'tournament' database: `psql tournament`
4. Import tables and views: `\i tournament.sql`
5. Quit psql: `\q`
6. Run the Python test script: `python tournament_test.py`

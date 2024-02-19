drop database if exists bdr_fog;

create database bdr_fog;

use bdr_fog;

create table Movies(
	Name VARCHAR (50) primary key,
	Score FLOAT not null,
	Director VARCHAR (50) not null,
	Star VARCHAR (50) not null,
	Runetime INT not null
);

create table ActorFilms(
	Actor_Film VARCHAR (100) primary key,
	Actor VARCHAR(50) not null,
	Film VARCHAR (50),
	foreign key (Film) references Movies (Name),
	Year_1 INT (4) not null
);

create table OscarWinner(
	Id INT primary key,
	Year_film INT (4) not null,
	Year_ceremony INT (4) not null,
	Ceremony INT(3) not null,
	Category VARCHAR (20) not null,
	Name VARCHAR (50) not null,
	Actor_film VARCHAR (100),
	foreign key (Actor_film) references ActorFilms(Actor_Film),
	Film VARCHAR (50),
	foreign key (Film) references movies (Name),
	Winner BOOLEAN
);
	

create table CostRevenue(
	Id INT primary key,
	Movie_title VARCHAR (50),
	foreign key (Movie_title) references Movies (Name),
	USD_Production DECIMAL (11,2) not null,
	USD_World_Wide DECIMAL (11,2) not null,
	USD_Domestic_Gross DECIMAL (11,2) not null
);

create table TitlesDisney(
	Show_id INT primary key,
	Title VARCHAR(50),
	foreign key (Title) references Movies(Name),
	Date_added DATE,
	Release_year INT (4) not null,
	Listen_in VARCHAR(50) not null,
	Description VARCHAR (200)
);

create table TitlesNetflix(
	Show_id INT  primary key,
	Title VARCHAR(50),
	foreign key (Title) references Movies(Name),
	Date_added DATE,
	Release_year INT (4) not null,
	Listen_in VARCHAR(50) not null,
	Description VARCHAR (200)
);



show tables;

describe Movies;
describe ActorFilms;
describe OscarWinner;
describe TitlesDisney;
describe TitlesNetflix;
describe CostRevenue;



insert into Movies (Name, Score, Director, Star, Runetime) values
	("The Shining", 8.4, "Stanley Kubrick", "Jack Nicholson", 146),
	("The Blue Lagoon", 5.8, "Randal Kleiser", "Brooke Shields",104),
	("Star Wars: Episode V - The Empire Strikes Back",8.7,"Irvin Kershner","Mark Hamill",124),
	("Airplane!",7.7, "Jim Abrahams", "Robert Hays",88);

insert into ActorFilms(Actor_Film, Actor, Film, Year_1) values
	("Brooke Shields-The Blue Lagoon","Brooke Shields","The Blue Lagoon",1967),
	("Carrie Fisher-Star Wars: Episode V - The Empire Strikes Back","Carrie Fisher","Star Wars: Episode V - The Empire Strikes Back",1980),
	("Leslie Nielsen-Airplane!","Leslie Nielsen","Airplane!",1990),
	("Jack Nicholson-The Shining","Jack Nicholson", "The Shining",1965);

insert into OscarWinner(Id, Year_film, Year_Ceremony, Ceremony,Category, Name, Actor_film, Film, Winner) values
	(1,1965, 2007, 3, "ACTOR","Jack Nicholson","Jack Nicholson-The Shining","The Shining",1),
	(2,1967, 2022, 18,"MOVIE","Brooke Shields","Brooke Shields-The Blue Lagoon","The Blue Lagoon",0),
	(3,1990, 2010, 6, "ART DIRECTION","Leslie Nielsen","Leslie Nielsen-Airplane!","Airplane!",1 ),
	(4,1980, 2012, 8, "CINEMATOGRAPHY","Carrie Fisher","Carrie Fisher-Star Wars: Episode V - The Empire Strikes Back","Star Wars: Episode V - The Empire Strikes Back",1);

insert into CostRevenue(Id, Movie_Title,USD_Production, USD_World_Wide, USD_Domestic_Gross ) values
	(1,"The Shining",1100000,1200000,2130000),
	(2,"Star Wars: Episode V - The Empire Strikes Back",12300000, 4520000,2340000),
	(3,"Airplane!",6530000,234940000,1324000),
	(4,"The Blue Lagoon",78430000,34134000,341343000);

insert into TitlesDisney(Show_Id,Title,Date_added, Release_year,Listen_in, Description) values
	(1,"The Blue Lagoon", "2020-03-15", 1967, "Family", "asdfefe"),
	(2,"The Shining", "2019-04-21", 1965, "Horror", "asdfefe"),
	(3,"Star Wars: Episode V - The Empire Strikes Back","2017-04-28", 1980, "Fiction","deceicnem"),
	(4,"Airplane!","2023-12-01","1990","Adventure", "An Airplane");

insert into TitlesNetflix(Show_Id,Title,Date_added, Release_year,Listen_in, Description) values
	(1,"Star Wars: Episode V - The Empire Strikes Back","2015-11-27", 1980, "Fiction","deceicnem"),
	(2,"Airplane!","2011-11-11","1990","Adventure", "An Airplane"),
	(3,"The Blue Lagoon", "2021-02-17", 1967, "Family", "asdfefe"),
	(4,"The Shining", "2018-09-29", 1965, "Horror", "asdfefe");


select * from Movies;
select * from CostRevenue;
select * from OscarWinner;
select * from TitlesDisney;
select * from TitlesNetflix;
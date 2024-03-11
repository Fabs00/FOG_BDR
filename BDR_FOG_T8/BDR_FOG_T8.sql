use bdr_fog;


create view vista1 as 
select actores.Actor from actores join netflix_titles on 
	actores.Actor = netflix_titles.cast;
	
select * from vista1;

create view vista2 as 
select title.amazon_titles from amazon_titles left join cost_revenue  on 
	title.amazon_titles = Movie_tile.cost_revenue;
	
select * from vista2;

create view vista3 as 
select actor.actorfilms from actorfilms  right join relased on 
	actor.actorfilms = relased.movies;
	
select * from vista3;


select actor from actores 
	where actor = (select name from movies where year > 2020 and genre = "horror");

create trigger nuevo
	after insert on amazon_titles for each row
		begin insert into actores actor values  (new."Jhonny Deep");

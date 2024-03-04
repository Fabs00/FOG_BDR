use bdr_fog;

select * from Movies;
select * from CostRevenue;
select * from OscarWinner;
select * from TitlesDisney;
select * from TitlesNetflix;

-- Promedio de duración de películas dependiendo algún actor
select  avg(Runetime) as Promedio_Pelicula  from movies m 
	where Star = "Jack Nicholson";

-- Conteo de péliculas por género
select Listen_in, count(*) as Genero from titlesdisney t group by Listen_in ;

-- Mínimo y máximo recaudado en EUA
select  min(USD_Production) as Minimo, max(USD_Production) as Máximo from costrevenue c ;

-- Cuantil distinto a la mediana
select ntile (5) over (order by USD_World_Wide) as Quintil from costrevenue c ;

-- Moda de la base
select USD_Domestic_Gross as moda, count(*) as frecuencia 
	from costrevenue c 
		order by USD_Domestic_Gross
			order by count (*) desc
				limit 1;
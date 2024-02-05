# Tarea 3
## Inciso A

Disney_plus_titles(show_id,type,title,director,cast,country,date_added,release_year,rating,duration,listed_in,description)
Netflix_titles(show_id,type,title,director,cast,country,date_added,release_year,rating,duration,listed_in,description)
Amazon_prime_titles(show_id,type,title,director,cast,country,date_added,release_year,rating,duration,listed_in,description)
Hulu_titles(show_id,type,title,director,cast,country,date_added,release_year,rating,duration,listed_in,description)
Time_view(Rank,Title,Type,Premiere,Genre,Watchtime,Watchtime in Million)
Movies(name,rating,genre,year,released,score,votes,director,writer,star,country,budget,gross,company,runtime)
Actorfilms(Actor,ActorID,Film,Year,Votes,Rating,FilmID)
IMDbMovies-Clean(Title,Summary,Director,Writer,Main Genres,Motion Picture Rating,Release Year,Runtime (Minutes),Rating (Out of 10),Number of Ratings (in thousands),Budget (in millions),Gross in US & Canada (in millions),Gross worldwide (in millions),Opening Weekend in US & Canada,Gross Opening Weekend (in millions))
Cost_revenue_dirty(Rank,Release_Date,Movie_Title,USD_Production_Budget,USD_Worldwide_Gross,USD_Domestic_Gross)
Imdb_top_1000(Poster_Link,Series_Title,Released_Year,Certificate,Runtime,Genre,IMDB_Rating,Overview,Meta_score,Director,Star1,Star2,Star3,Star4,No_of_Votes,Gross)
The_oscar_award(year_film,year_ceremony,ceremony,category,name,film,winner)

## Inciso B
https://www.figma.com/file/0hOAnbO1I2taK6Opy0S3Xw/Diagrama-Relacional?type=whiteboard&node-id=0%3A1&t=6Lbz9mMnEnsxy1Du-1

## Inciso C
1.- Cuantas horas se ha reproducido la "pelicula_1"
σTitle = “película_1”( Time_view)

2.- Que categorías han ganado en los oscares las peliculas añadidas a Amazon Prime durante el 2022
 σtitle,date_added = 2022 (Amazon_prime_titles) Ո  σcategory,winner = 1 (AThe_oscar_award)

3,. Que peliculas dentro del top 10de IMDB se han emitido en algún servicio de streaming
σIMDB_Rating <11 (AImdb_top_1000) Ո (σTitle, (Hulu_titles) Ս σTitle, (Disney_plus_titles) Ս σTitle, (Netflix_titles) Ս σTitle, (Amazon_prime_titles))

4.- Cual es el poster de la pelicula mas cara de producir
σ Movie_title, max USD_Production (Cost_revenue_dirty) Ո  σ Series_Title (Imdb_top_1000)

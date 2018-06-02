CREATE TABLE Movie (
movie_name VARCHAR(75),
movie_id INT,
director_id INT,
year_released INT,
budget INT,
PRIMARY KEY(movie_id),
FOREIGN KEY(director_id) REFERENCES Director(director_id)
);
CREATE TABLE Director (
director_id INT,
director_name VARCHAR(75),
director_country VARCHAR(75),
PRIMARY KEY(director_id)
);

--Find	the	id	and	name of	all	directors	who have	directed	more	than	20	movies.

select D.director_id, D.director_name
from Director as D, Movie as M
where D.director_id = M.movie_id
Group By D.director_id, D.director_name
Having count(M.movie_id) > 20;

--For	each	director,	find	the	corresponding	movie	that	has	the	highest	budget

With high As (select D.director_id as did, max(M.budget) as mb
  From Director As D, Movie AS M
  Where D.director_id = M.movie_id
  Group By D.director_id)
select D2.director_id, D2.director_name, max(M2.movie_name)
From Director as D2, Movie as M2, high as h
Where D2.director_id = h.did
  and D2.director_id = M2.director_id
  and h.mb = M2.budget;


/* Condition 1*/

select *
from IMDB

where Budget > 40000000
ORDER BY CAST(IMDB.Movie_id as VARCHAR(Max)) ASC



/* Condition 2*/
 
SELECT  *
from genre
where genre LIKE 'C%'
ORDER BY CAST(genre.Movie_id as VARCHAR(Max)) ASC


/* Condition 3*/

with newtable as (
select Movie_id,  CONVERT(INT, left(  RIGHT (CAST( Title as VARCHAR(Max)) ,5),4) )   as year

from IMDB )

select Movie_id, year
from newtable
WHERE year = 2014

ORDER BY CAST(newtable.Movie_id as VARCHAR(Max)) ASC



/* Condition 4*/


select Movie_id,  CONVERT(INT, left(  RIGHT (CAST( Title as VARCHAR(Max)) ,5),4) )   as year

from IMDB 

WHERE CONVERT(INT, left(  RIGHT (CAST( IMDB.Title as VARCHAR(Max)) ,5),4) ) = 2014



/* Inner Join*/



SELECT   DISTINCT CAST(Movie_id1 AS nvarchar(max)) as Movie_id4 , CAST(Title AS nvarchar(max)) as Title, Budget, year

FROM (
    
select Movie_id as Movie_id1 , Title, Budget
from IMDB

where Budget > 40000000

) as table1


INNER JOIN (
    

SELECT  Movie_id as Movie_id2, genre
from genre
where genre LIKE 'C%'


) as table2 ON table1.Movie_id1 = table2.Movie_id2



INNER JOIN (
    
select Movie_id as Movie_id3,  CONVERT(INT, left(  RIGHT (CAST( Title as VARCHAR(Max)) ,5),4) )   as year

from IMDB 

WHERE CONVERT(INT, left(  RIGHT (CAST( IMDB.Title as VARCHAR(Max)) ,5),4) ) = 2014



) as table3 ON table2.Movie_id2 = table3.Movie_id3


/* View*/


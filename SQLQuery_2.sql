/* Table 1*/

SELECT *
from IMDB


/* Table 2*/

SELECT  *
from genre


/* Table 3*/

SELECT  *
from earning



/* Movies released in 2012 */

SELECT Movie_id,  
CONVERT(INT, left(  RIGHT (CAST( Title as VARCHAR(Max)) ,5),4) )   as year
from IMDB 

WHERE 
CONVERT(INT, left(  RIGHT (CAST( IMDB.Title as VARCHAR(Max)) ,5),4) ) = 2012


/* The Metacritic rating of the movies should be more than 60 */

SELECT *
from IMDB

where MetaCritic > 60
ORDER BY CAST(IMDB.Movie_id as VARCHAR(Max)) ASC


/* The domestic collections of the movies should exceed 100 million */

SELECT  *
from earning

where Domestic > 100000000
ORDER BY CAST(earning.Movie_id as VARCHAR(Max)) ASC






/* Inner Join*/


/* Condition 1*/

SELECT   DISTINCT  CAST(Movie_id1 AS nvarchar(max)) as Movie_id4 , CAST(Title AS nvarchar(max)) as Title

FROM (  

SELECT Movie_id as Movie_id1, Title,
CONVERT(INT, left(  RIGHT (CAST( Title as VARCHAR(Max)) ,5),4) )   as year
from IMDB 

WHERE 
CONVERT(INT, left(  RIGHT (CAST( IMDB.Title as VARCHAR(Max)) ,5),4) ) = 2012


) as table1

INNER JOIN (

/* Condition 2*/


SELECT CAST(Movie_id AS nvarchar(max)) as Movie_id2, MetaCritic
from IMDB

where MetaCritic > 60


) as table2 ON table1.Movie_id1 = table2.Movie_id2

INNER JOIN (

/* Condition 3*/


SELECT  CAST(Movie_id AS nvarchar(max)) as Movie_id3, Domestic
from earning

where Domestic > 100000000


) as table3 ON table2.Movie_id2 = table3.Movie_id3



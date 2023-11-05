




-- this is the given table from coding ninja and it doesn't work on sql server.
CREATE TABLE IF NOT EXISTS students (
  id numeric ,
  name text NOT NULL,
  gender text NOT NULL,
  PRIMARY KEY(id)
);
-- insert some values
INSERT INTO students VALUES (1, 'Ryan', 'M');
INSERT INTO students VALUES (2, 'Joanna', 'F');


-- ------------------------------------------------------



-- this is the corrected script.

/*  this will check if a table students exsist and drops it and create a new table */




IF OBJECT_ID(N'dbo.students', N'U') IS NOT NULL
DROP TABLE dbo.students;
CREATE TABLE students (
  id INT PRIMARY KEY, -- numeric primary key
  name VARCHAR(50) NOT NULL, -- text column
  gender VARCHAR(10) -- text column
);


select *
from students


/*-------------------------------------*/

/*  this will insert new raws  */


INSERT INTO students (id, name, gender)
VALUES
(1, 'Ryan', 'M'),
(2, 'Joanna', 'F'),

(3, 'Kim', 'F'),
(4, 'Molina', 'F'),
(5, 'Dev', 'M')

;

select *
from students










-- 1) Create a transaction to enter a new tournament. 

USE bowlingleagueexample;
SET autocommit = 0;
Start transaction;
Select * 
from tournaments t 
where tourneyid = 21
and tourneylocation like '%tamuc%';
insert into tournaments values (21, '2016-11-29', 'tamuc');
commit;

-- 2) Create a transaction to enter a new tournament.
-- /This transaction will do the following steps: a. Check to see whether tournament that has ID 20 and tourney location ‘Totem Lanes’ is inserted into table ‘tournaments’.
-- /If there is a record, tournament that has ID 20, ‘2016-11-29’ Tourney Date, and ‘Totem Lanes’ Tourney Location is entered into the table ‘tournament’.
--  /Rollback all changes in the end of the transaction.

USE bowlingleagueexample;
SET autocommit = 0;
Start transaction;
Select * 
from tournaments t 
where tourneyid = 20
and tourneylocation like '%totem lanes%';
rollback;


insert into tournaments values (20, '2016-11-29', 'totem lanes');

rollback;

-- 3) Create a function that can calculate maximum handicap score for a specific input bowler’s (first name and last name).
SELECT ASSIGNMENT8QQ3('JOHN' , 'KENNEDY');

-- Function
-- (CREATE DEFINER=`root`@`localhost` FUNCTION `Assignment8QQ3`(FN VARCHAR(100), LN VARCHAR(100)) RETURNS double
-- DETERMINISTIC
-- BEGIN
-- DECLARE HANDI DOUBLE;
-- SELECT MAX(HANDICAPSCORE) INTO HANDI
-- FROM BOWLER_SCORES BS, BOWLERS B
-- WHERE B.BOWLERID = BS.BOWLERID
-- AND B.BOWLERFIRSTNAME LIKE FN
-- AND B.BOWLERLASTNAME LIKE LN;
-- RETURN HANDI;
-- END

-- 4) Create a function that can find a team name for a specific input capture’s first name, and last name
SELECT assign8QQ4('JOHN' , 'KENNEDY');
--   CREATE DEFINER=`root`@`localhost` FUNCTION `question4`(FN VARCHAR(100), LN VARCHAR(100)) RETURNS varchar(100) CHARSET utf8mb4
--  DETERMINISTIC
-- BEGIN
-- DECLARE HANDI varchar(100);
 -- SELECT  t.teamname INTO HANDI
 -- FROM teams t , BOWLERS B
 -- WHERE t.teamID = B.teamID
-- AND B.BOWLERFIRSTNAME LIKE FN
-- AND B.BOWLERLASTNAME LIKE LN ;
-- RETURN handi;
-- END

-- 5) Create a transaction to enter a new tournament. This transaction will do the following steps: 
-- a. Check to see whether tournament that has ID 25 and tourney location ‘Bolero Lanes’ is inserted into table ‘tournaments’.
-- b. If there is no record, tournament that has ID 25, ‘2016-11-20’ Tourney Date, and ‘Imperial Lanes’ Tourney Location is entered into the table ‘tournament’.
-- c. Accept all changes in the end of the transaction.

USE bowlingleagueexample;
-- disable auto-commit
SET autocommit = 0;

Start transaction;

Select * 
from tournaments t 
where tourneyid = 25
and tourneylocation like '%Bolero Lanes%';

-- use rollback; if previous statement retuens 1

insert into tournaments values (25, '2016-11-20', 'Bolero Lanes');

commit;
USE Bowlingleagueexample;

-- 1. Create View to display all team names.
Create view team_namesVW1 as select TeamName from TEAMS;

-- 2. Create View to display name of teams which has average raw score greater than 150.
Create view teams_namesVW2 as 
select t.TeamName from TEAMS t, Bowlers b, Bowler_scores bs 
where t.TeamID = b.TeamID and b.BowlerID = bs.BowlerID
GROUP BY b.TeamID HAVING avg(bs.Rawscore)>150;

-- 3. Create View to display id of tournament which has highest average handicap score.
create or replace view Q3 as
select tm.tourneyid, max(avg(bs.handicapscore))
from tourney_matches tm, match_games mg, bowler_scores bs
where tm.matchid = bs.matchid
and mg.matchid = bs.matchid
and mg.gamenumber = bs.gamenumber
group by tm.tourneyid;
-- create table that store avg handicap score for all tourneys
create or replace view Q3 as
select Q3_1.tourneyid, max(Q3_1.averagescore)
from Q3_1;
-- create able to pull only max handicap score from previous table
SELECT * FROM Q3;
USE bowlingleagueexample;

-- 4. Create View to display total numbers of bowlers attended each tournament. 
create or replace view Q4 as
select tm.tourneyid, count(bs.bowlerid)
from tourney_matches tm, match_games mg, bowler_scores bs
where tm.matchid = bs.matchid
and mg.matchid = bs.matchid
and mg.gamenumber = bs.gamenumber
group by tm.tourneyid;

-- 5. Show first name, last name of bowler, and indicate whether bowler lives in west coast states.
CREATE OR REPLACE VIEW Q5VW_1 AS
select bowlerlastname , bowlerfirstname , bowlerstate  from bowlers where bowlerstate='WA';
select  bowlerlastname , bowlerfirstname , bowlerstate from Q5VW_1;

-- 6. Show first name, last name of bowler, and indicate whether bowler scores ‘Strike’ in last round a bowler scores ‘Strike’ in last round when his handicap score is greater than his raw score by 10points.
create  or replace view Q6_1 as
select bs.gamenumber,b.BowlerLastName,b.BowlerFirstName,mg.matchid,RawScore,
(case
when (bs.HandiCapScore)>bs.RawScore then 'STRIKE'
end) as strike
 from bowlers b,
bowler_scores bs,match_games mg
where b.bowlerid=bs.bowlerid and mg.matchid=bs.matchid;
select * from Q6_1;

-- 7. Show first name, last name, and performance of bowler for each game. Bowler over-performs for one game when his/her handicap score is greater than his/her all time average handicap score. If his/her handicap score is less than or equal his/her all time average handicap score,bowler is under-performed.
create or replace view Q7_1 as
 select bowlerid, avg(bs.handicapscore)
 from bowler_scores bs
 group by bs.bowlerid;
 -- this table create avg score for every bowler 
 select bs.matchid, bs.gamenumber, b.bowlerfirstname, b.bowlerlastname,
 ( case 
 when bs.handicapscore > q7_1.handicapcore then 'high performance'
 when bs.handicapscore < q7_1.handicapcore then 'low performance'
 else 'none'
 end) as performance
 from bowlers b, Q7_1, bowler_scores bs
 where b.bowlerid = Q7_1.bowlerid
 and b.bowlerid = bs.bowlerid;

-- 8. List tournament matches and indicate whether the matches have the highest handicap score in the tournament.
create or replace view Q8_1 as
select sum(bs.handicapscore) as handicapscore ,tm.tourneyid,mg.matchid from tourney_matches tm 
inner join(select matchid,gamenumber from match_games) mg on mg.matchid=tm.matchid
inner join (select matchid,gamenumber, handicapscore,bowlerid from bowler_scores) bs on mg.matchid=bs.matchid group by tm.matchid;
create or replace view Q8_2 as
select  Q8_1.tourneyid,max(Q8_1.handicapscore) as max from Q8_1 group by Q8_1.tourneyid;
create or replace view Q8_3 as
select Q8_1.handicapscore,Q8_1.matchid,Q8_1.tourneyid,
(case
when Q8_1.handicapscore >Q8_2.max then 'High'
else 'No'
end) as result
from Q8_1, Q8_2 where Q8_1.tourneyid=Q8_2.tourneyid;
select Q8_3.* from Q8_3 where result like 'High';

-- 9.Create View to display all team ids
Create view team_IdsVW1 as select TeamId from TEAMS;

-- 10. Create View to display all captain ids
Create view cap_IdsVW1 as select captainId from TEAMS;



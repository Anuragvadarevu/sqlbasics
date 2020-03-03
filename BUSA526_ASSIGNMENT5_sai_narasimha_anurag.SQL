use bowlingleagueexample;
question1
SELECT b.BowlerID, b.BowlerFirstName, b.BowlerLastName FROM Bowlers b 
WHERE b.BowlerID IN (SELECT bs.BowlerID FROM Bowler_Scores bs where bs.RawScore <= 100);
question2--list the tournaments that have not yet been played--
SELECT * from tournaments t
WHERE t.tourneyid NOT IN
( SELECT tm.Tourneyid from tourney_matches tm);
question3--
SELECT t.CaptainID,t.TeamID,t.TeamName
FROM (select * from teams) AS t
WHERE t.teamid IN (SELECT tm.OddLaneTeamID FROM tourney_matches AS tm)
and t.teamid NOT IN (SELECT tm1.evenlaneteamID FROM tourney_matches AS tm1);
--question4--
select * from Bowlers b
where b.TeamID NOT IN (SELECT t.TeamID from teams t); 
--question5--
select b.bowlerid, bs.matchid, bs.gamenumber, bs.handicapscore, t.tourneydate, t.tourneylocation 
from bowlers b, bowler_scores bs, match_games mg, tourney_matches tm, tournaments t 
where b.bowlerid=bs.bowlerid and bs.handicapscore<=200 and bs.wongame=1 and bs.matchid=mg.matchid
 and bs.gamenumber=mg.gamenumber and mg.matchid=tm.matchid
and tm.tourneyid=t.tourneyid and t.tourneylocation in ('thnderbird lanes', 'totem lanes', 'bolero lanes');
question6
SELECT * from tournaments t
WHERE t.tourneyDate <= all
( SELECT t.tourneyDate from tournaments t);
--question7--
SELECT c.bowlerlastname, c.bowlerfirstname
FROM 
(SELECT b.bowlerlastname, b.bowlerfirstname, b.bowlerid, b.teamid, bs.handicapscore
FROM teams t, bowlers b, bowler_scores bs
WHERE t.captainid = b.bowlerid
AND b.bowlerid = bs.bowlerid) as c
WHERE c.handicapscore > ALL 
(SELECT bs.handicapscore
FROM bowlers b, bowler_scores bs
WHERE b.bowlerid = bs.bowlerid
AND b.bowlerid <> c.bowlerid
AND b.teamid = c.teamid);
question8
select  bl.BowlerFirstName,bl.BowlerLastName,t.teamid,bs.bowlerid,rawscore
     from teams t,bowlers bl,bowler_scores bs 
     where bl.teamid = t.teamid and bs.bowlerid=bl.bowlerid and  
     bs.rawscore <= all(select rawscore from bowler_scores);
question9:
SELECT b.BowlerID, b.BowlerFirstName, b.BowlerLastName FROM Bowlers b 
WHERE b.BowlerID IN (SELECT bs.BowlerID FROM Bowler_Scores bs where bs.RawScore > 100);
question10; displaying bowlers whose id is eaqual to 12
SELECT b.BowlerID, b.BowlerFirstName, b.BowlerLastName FROM Bowlers b 
WHERE b.BowlerID IN (SELECT bs.BowlerID FROM Bowler_Scores bs where bs.BowlerID  = '12');


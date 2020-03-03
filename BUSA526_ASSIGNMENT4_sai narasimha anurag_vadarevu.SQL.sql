
Question 1:
select s.TeamName from Teams s;

Q2:
select s.TeamName,b.BowlerLastName,b.BowlerFirstName 
from Bowlers b,Teams s
 where s.CaptainID  =b.BowlerID;

q3
 select b.*,s.TeamName 
 from Bowlers b,Teams s 
 where s.TeamID =b.TeamID;


q4
 select t.TourneyDate,t.TourneyLocation 
 from Tournaments t;

q5
Select b.BowlerID,b.BowlerLastName, b.BowlerFirstName, bs.MatchID, bs.GameNumber, bs.RawScore 
From bowlers b
 left join bowler_scores bs on b.BowlerID = bs.BowlerID;


q6
 select b.*,s.TeamName,s.CaptainID from bowlers b,Teams s where b.TeamID = s.TeamID;
 
 q7
 SELECT b.BowlerFirstName, b.BowlerLastName, tt.tourneyID, tt.tourneyLocation, tt.tourneyDate, tm.MatchID
 from  Teams t,  Tournaments tt, Bowlers b, Tourney_Matches tm
 WHERE t.TeamID = b.TeamID
 AND t.TeamID = tm.EvenLaneTeamID OR t.TeamID = tm.OddLaneTeamID AND tt.tourneyID = tm.tourneyID;
 
 q8
 SELECT tm.EvenLaneTeamID, tt.tourneyDate, tt.tourneyID, tt.tourneyLocation, tm.MatchID, tm.EvenLaneTeamID, tm.OddLaneTeamID 
 FROM Tourney_Matches tm
 left join tournaments tt on tm.tourneyID= tt.tourneyID;
 

 q9: 
 Show bowlerinformation who are Team Captains
Select b.*
from Bowlers b, Teams s
where b.Teamid = s.TeamID AND b.BowlerID = s.CaptainID;

q10
info of the bowlers  whose bowlers zipcode is 98052
select b.* from Bowlers b where b.Bowlerzip Like 98052;
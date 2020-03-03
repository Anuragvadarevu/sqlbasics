use bowlingleagueexample;
/**1**/
select b.bowlerId, avg(rawscore) from bowlers b, bowler_scores bs where b.bowlerId = bs.bowlerId group by b.bowlerId;
/**2**/
select t.teamName,  avg(bs.rawScore) 
from teams t, bowlers b, bowler_scores bs
where t.teamid=b.teamid and b.bowlerid=bs.bowlerid and t.teamname like '%sharks%';
/**3**/
select t.teamName,  avg(bs.rawScore) 
from teams t, bowlers b, bowler_scores bs
where t.teamid=b.teamid and b.bowlerid=bs.bowlerid and t.teamname like '%Dolphins%'
group by b.bowlerId having avg(bs.rawScore) > 100;

/**4**/
select t.teamName, b.bowlerfirstName, b.bowlerlastName, avg(bs.rawScore) 
from teams t, bowlers b, bowler_scores bs 
where b.teamId = t.teamId and b.bowlerId = bs.bowlerid and t.teamName = 'Dolphins' 
group by b.bowlerId having avg(bs.rawScore) > 
(select avg(rawscore) from bowler_scores);

/**5**/
select evenTeamName, evenlaneCount, ifNull(oddLaneCount,0) oddLaneCount from 
(select t.teamId evenTeamId, t.teamName evenTeamName, count(*) evenLaneCount
from teams t, tourney_matches tm 
where t.teamId = tm.evenLaneTeamId
group by t.teamName) as evenLaneTable
left JOIN
(select t.teamId oddTeamId, t.teamName oddTeamName, count(*) oddLaneCount
from teams t, tourney_matches tm 
where t.teamId = tm.oddLaneTeamId
group by t.teamName) as oddLaneTable
on evenLaneTable.evenTeamId = oddLaneTable.oddTeamId where ifnull(evenLaneCount,0)>ifnull(oddLaneCount,0);
/**6**/
select distinct b.bowlerid,b.bowlerfirstname,b.bowlerlastname,bs.gamenumber,bs.matchid,min(bs.rawscore) from bowler_scores bs
join (select * from bowlers) b on bs.bowlerid=b.bowlerid
group by bs.matchid,bs.gamenumber
order by bs.matchid;
/**/
/**7**/
select bs.bowlerid,bs.handicapscore,t.teamname,b.bowlerfirstname,b.bowlerlastname from bowler_scores bs
join (select * from bowlers) b on b.bowlerid=bs.bowlerid
join (select * from teams) t on t.captainid=b.bowlerid
order by handicapscore desc limit 1;

/**8**/
select b.bowlerfirstname, b.bowlerlastname, bs.handicapscore, t.teamname, avg(bs.handicapscore) averge
from bowlers b, bowler_scores bs, teams t
where b.bowlerid=bs.bowlerid and b.teamid=t.teamid 
group by b.bowlerfirstname, b.bowlerlastname, t.teamname
having bs.handicapscore>avg(bs.handicapscore)+5;

/**9**/
select bs.matchID, t.teamname, b.bowlerfirstname, b.bowlerlastname, min(handicapscore) 
from bowlers b, bowler_scores bs, teams t 
where b.teamid = t.teamid and bs.bowlerid=b.bowlerid and wongame=0
group by bs.matchID, t.teamname, b.bowlerfirstname, b.bowlerlastname;

/**10**/
select b.bowlerLastName, t.teamName, min(length(b.bowlerLastName))
from bowlers b, teams t 
where b.teamId = t.teamId
group by b.teamId; 

use rollandgaross_tournment_organistaion;
/*show players and their ranks which rank less than 5*/
select pfname as Player_name , prank as ATP_Rank
from player
where prank<5;
/* show the highest player and his height  */
select pfname as highest_player , pheight as the_height
from player
where pheight = 
(select max(pheight)
  from player);
  /*show the players that won a game */
select distinct p.pfname 
 from player p , play y 
 where p.pid=y.player_pid and y.score=3;
 /*show the players and their height in descending oreder */
 SELECT 
    pfname AS `tallest_player`, pheight AS the_height
FROM
    player
ORDER BY pheight DESC;
 
/*show the rollandgaross tournment winner */
select p.pfname as the_winner
from player p , play y
where p.pid=y.player_pid and y.score=3
group by p.pfname
having count(y.score)=3;
/* show the loser and winner and match number which player first name is rafael */
select distinct p.pfname as winner_player , y.match_mno as match_no,
 n.pfname as loser_againest_winner
from player p , play y , player n , matchh m , play o 
where (p.pid=y.player_pid  and p.pfname='rafael' and y.score=3) and
 ( n.pid=o.player_pid and y.match_mno=o.match_mno and o.score<3 );
/* show player first name  and their sponser name  */ 
select p.pfname as player , s.sname as sponser_of_name
from player p join sponser s
on p.pid = s.spid ;
/* show employee name which has max daily salary  */
select e.efname as Employee_name, d.dsalary as Max_salary
from employee e join daily_salary d
on e.eid=d.employee_eid and d.dsalary=
(select max(d.dsalary)
from daily_salary d natural join employee e);
/* show employee max an min salary */
select max(w.wsalary) as Max_salary,min(w.wsalary) as Mini_salary
from employee e join weekly_salary w
on e.eid=w.employee_eid;
/* show the player and their coach name*/
select p.pfname as  Player_name, c.cfname as Coach_name
from player p join coatch c 
on p.coatch_cid = c.cid;
/*show player name that played in court philippe  */
select p.pfname as players_in_court_philippe
from player p join play x
on p.pid=x.player_pid 
 join
matchh m
on m.mno=x.match_mno 
join
court c
on c.c_no=m.court_c_no and
c.c_name='philippe';
/* show players that have  letter " o " in their name */
select p.pfname
from player p , play y
where p.pid = y.player_pid and y.score=3 and p.pfname like '%o%';

/* show the match loser in this torny */
select p.pfname as loser_of_the_tournment
from player p , play y
where p.pid = y.player_pid and y.score in (1 , 2 , 0);
/* show the number of fans in every match */
select count(f.fid) as the_number_attendance , y.match_mno as match_number
from fan f , fan_has_match y , matchh m
where f.fid=y.fan_fid and m.mno=y.match_mno
group by y.match_mno ;

/* show gard name and their year of experiance */
select e.efname as gard_name , g.yearofex as year_of_experiance
from gard g join employee e 
on g.employee_eid=e.eid
order by g.yearofex ;

/* show ball boy and their accademy which match number is =11 */
select e.efname as Ball_boy, b.baccademyname as Academy_name , m.mno as Match_number
from employee e join ball_boy b 
on e.eid=b.employee_eid 
join court_has_employee c
on e.eid=c.employee_eid
join court o
on c.court_c_no=o.c_no
join matchh m
on m.court_c_no=o.c_no
and m.mno=11;

/* show gards name which match number is 22 */
select e.efname as Gard_name , m.mno as Match_number
from employee e join gard g
on e.eid=g.employee_eid 
join court_has_employee c
on e.eid=c.employee_eid
join court o
on c.court_c_no=o.c_no
join matchh m
on m.court_c_no=o.c_no
and m.mno=22;

/* show number of referee that particpate in match 11 */
select count(r.rid) as number_of_referee , m.mno as match_no 
from referee r , has h , matchh m 
where r.rid=h.referee_rid and m.mno=h.match_mno and m.mno=11;


/*show line referee name (first and last combined) and their position which match number is 33  */
select concat ( r.rfname ,'  ', r.rlname) as line_referee , m.mno as Match_number , l.position
from referee r join line_ref l 
on r.rid=l.referee_rid
join has h
on h.referee_rid=r.rid
join matchh m
on m.mno=h.match_mno 
and m.mno=33;
/* show umberlla referee name (first and last combined) which match number is 33  */
select concat ( r.rfname ,'  ', r.rlname) as umbrella_referee , m.mno as Match_number 
from referee r join umprella_ref u 
on r.rid=u.referee_rid
join has h
on h.referee_rid=r.rid
join matchh m
on m.mno=h.match_mno 
and m.mno=33;

/* show player name and his coach which they are in same country */
select p.pfname as player , c.cfname as coach , p.pcountry as country
from player p , coatch c 
where p.coatch_cid=c.cid and p.pcountry=c.ccountry;

/* show the summation of daily salary and average of daily (by using agregate function) */
select sum(d.dsalary) as sum_of_daily_salary, avg(d.dsalary) as average_of_daily_salary
from daily_salary d , employee e
where d.employee_eid=e.eid;

/* retrieve player name and his total score*/
select p.pfname as Player_name ,sum(x.score)  as Total_score
from player p join play x
on p.pid=x.player_pid
group by p.pfname
order by sum(x.score) asc ;
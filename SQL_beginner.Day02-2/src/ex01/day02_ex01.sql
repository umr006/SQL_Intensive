select pv.visit_date missing_date from (select visit_date from person_visits pv where visit_date between '2022-01-01' and '2022-01-10') pv
left join (select * from person_visits pv2 where person_id in (1,2)) pv2 on pv.visit_date = pv2.visit_date
where pv2.person_id is null
group by missing_date
order by pv.visit_date;
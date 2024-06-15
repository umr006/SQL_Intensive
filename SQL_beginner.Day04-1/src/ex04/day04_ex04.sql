create view v_symmetric_union as
with 
R as (
	select person_id  from person_visits pv where visit_date = '2022-01-02'
),

S as (
	select  person_id  from person_visits pv where visit_date = '2022-01-06'
),

RexpS as (
	select * from R 
	except
	select * from S
),

SexpR as (
	select * from S 
	except 
	select * from R
)

select * from RexpS
union
select * from SexpR
order by 1;
select generated_date missing_date from v_generated_dates
except
select visit_date from person_visits pv 
order by 1;
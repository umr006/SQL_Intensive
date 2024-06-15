set enable_seqscan = off;

create index if not exists idx_person_name on person (upper(name));

explain analyze select upper(name) from person where upper(name) = 'DMITRIY'; 

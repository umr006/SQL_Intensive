create index if not exists idx_menu_pizzeria_id on menu (pizzeria_id);

create index if not exists idx_person_order_person_id on person_order (person_id);
create index if not exists idx_person_order_menu_id on person_order (menu_id);

create index if not exists idx_person_visits_person_id on person_visits (person_id);
create index if not exists idx_person_visit_pizzaria_id on person_visits (pizzeria_id);

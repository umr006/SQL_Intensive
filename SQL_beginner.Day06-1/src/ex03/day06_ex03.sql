SET enable_seqscan = OFF;
show enable_seqscan;

CREATE UNIQUE INDEX if not EXISTS idx_person_discounts_unique on person_discounts(person_id, pizzeria_id);

EXPLAIN ANALYZE
SELECT	p.name, 
    m.pizza_name,
        m.price,
        round(m.price - (m.price * (discount / 100)), 0) discount_price,
        pz.name
FROM person_discounts pd
  JOIN person p ON p.id = pd.person_id
    JOIN menu m on m.pizzeria_id = pd.pizzeria_id
    join pizzeria pz on pd.pizzeria_id = pz.id
order by 1,2;

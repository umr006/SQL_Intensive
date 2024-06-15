WITH Ledger AS (
	SELECT 
		COALESCE((SELECT name FROM "user" WHERE id = Archive.user_id), 'not defined') AS name,
        COALESCE((SELECT lastname FROM "user" WHERE id = Archive.user_id), 'not defined') AS lastname,
        type,
        SUM(money) AS volume,
        COALESCE((SELECT DISTINCT name FROM currency WHERE id = Archive.currency_id), 'not defined') AS currency_name,
        COALESCE((SELECT rate_to_usd
                  FROM currency
                  WHERE id = Archive.currency_id
                  ORDER BY currency.updated DESC
                  LIMIT 1), 1)  AS last_rate_to_usd
	FROM 
		(SELECT DISTINCT user_id, type, currency_id, money
         FROM balance
         GROUP BY user_id, currency_id, type, money) AS Archive
    GROUP BY 
    	name,
    	lastname,
    	type,
    	Archive.currency_id
)
SELECT 
	*, 
	volume * last_rate_to_usd AS total_volume_in_usd
FROM 
	Ledger	
ORDER BY 
	name DESC,
	lastname ASC,
	type ASC;

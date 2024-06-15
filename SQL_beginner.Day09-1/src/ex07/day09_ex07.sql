CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC
AS $$
DECLARE
    min_value NUMERIC;
BEGIN
    SELECT MIN(value) INTO min_value
    FROM unnest(arr) AS value;

    RETURN min_value;
END;
$$ LANGUAGE plpgsql;


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
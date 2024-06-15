CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10) 
RETURNS TABLE (fibonacci_number INT) AS $$
DECLARE
    fib1 INT := 0;
    fib2 INT := 1;
    temp INT := 0;
BEGIN
    WHILE fib1 < pstop LOOP
        fibonacci_number := fib1;
        RETURN NEXT;
        temp := fib1 + fib2;
        fib1 := fib2;
        fib2 := temp;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
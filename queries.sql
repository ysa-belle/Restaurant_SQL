-- insert
INSERT INTO Supplier VALUES ('$b1', '$b2');


-- delete
DELETE FROM givesOrderOrder WHERE order# = '$res';


-- update
UPDATE Sells
SET price = '$res3'
WHERE sid = '$res1' AND ingredName = '$res2';


-- selection
-- projection
SELECT '$res' FROM Customer;


-- join (find manager name given restaurant branch number)
SELECT mname FROM Manager m, hasRestaurant hr WHERE m.empNum = hr.empNum AND branchNum= $res;


-- Aggregation with Group By (find highest/lowest/average salary of chef for each years of cooking experience)
SELECT YearsOfExp, MIN/MAX/AVG(salary)
FROM Chef
GROUP BY YearsOfExp;


-- Aggregation with Having (find the most recent year a manager was promoted after 2017 for each city with 2 branches)
SELECT city, max(yrPromoted)
FROM hasRestaurant hr, manager m
WHERE hr.empNum = m.empNum AND yrPromoted > 2017
GROUP BY city
HAVING COUNT(*) = 2;


-- Nested Aggregation with Group By



-- Division (find the supplier that provides all the special ingredients)
SELECT s.sid
FROM sells s
WHERE NOT EXISTS ((SELECT si.ingredName
                FROM SpecialIngredient si)
                EXCEPT
                (SELECT si.ingredName
                FROM SpecialIngredient si, Sells s
                WHERE si.ingredName = s.ingredName));
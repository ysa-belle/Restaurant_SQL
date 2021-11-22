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
-- join
SELECT mname FROM Manager m, hasRestaurant hr WHERE m.empNum = hr.empNum AND branchNum= '$res';
-- Aggregation with Group By (find highest/lowest/average salary of chef for each years of cooking experience)
SELECT name, MIN/MAX/AVG(salary)
FROM Chef
GROUP BY YearsOfExp

-- Aggregation with Having
-- Nested Aggregation with Group By
-- Division (find the supplier that provides all the special ingredients)
SELECT s.sid
FROM sells s
WHERE NOT EXIST ((SELECT si.ingredName
                FROM SpecialIngredient si)
                EXCEPT
                (SELECT si.ingredName
                FROM SpecialIngredient si, Sells s
                WHERE si.ingredName = s.ingredName))
SELECT 0

SELECT 0
WHERE 1 =2


/*
SELECT *
*/

SELECT COUNT(*)

SELECT COUNT(*)
WHERE 1 = 2

SELECT COUNT(*)
HAVING 1 = 2

SELECT 1
HAVING 1 = 2

SELECT 1
HAVING 1 = 1

SELECT 1
WHERE 1 = 0
HAVING 1 = 1


SELECT 'Something'
WHERE 1 = 0
HAVING 1 = 1

/*
Having forces grouping, and without a GROUP BY clause, it's a single group
aggregating the whole set ( which could be empty)
*/


SELECT productid  supplierid
FROM Production.Products

/*
A ^ B v C ^ D


A ^ ( B v C)
=>
A ^ B v A ^ C

*/

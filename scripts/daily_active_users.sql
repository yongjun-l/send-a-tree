SELECT COUNT(DISTINCT(usrid)) FROM
(SELECT * FROM free_tree
UNION ALL 
SELECT * FROM super_tree) as free_and_super
WHERE logdate = (SELECT current_date-1 as yesterday);

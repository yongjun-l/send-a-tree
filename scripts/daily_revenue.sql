SELECT revenue
FROM
  (SELECT logdate, SUM(revenue) as revenue
  FROM (SELECT all_logs.logdate AS logdate, 
               all_logs.all_sends -COALESCE(first_super_send.free_super,0) AS revenue
        FROM 
           (SELECT   usrid, --day that each user sent their first super tree
                     MIN(logdate) AS logdate, 
                     1 AS free_super --need to subtract 1 from each usr on specified date
            FROM     super_tree
            GROUP BY usrid) AS first_super_send        
        FULL OUTER JOIN 
           (SELECT   logdate, --all logs of super tree by date and usrid  
                     usrid, 
                     COUNT(*) AS all_sends
            FROM     super_tree
            GROUP BY logdate, usrid) AS all_logs       
         ON first_super_send.usrid = all_logs.usrid 
         AND first_super_send.logdate = all_logs.logdate) AS final_query
  GROUP BY logdate
  ORDER BY logdate DESC) as last_record
LIMIT 1;

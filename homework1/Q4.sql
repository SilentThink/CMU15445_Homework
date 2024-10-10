SELECT WORK_TYPE, WORK_NAME, COMMENT_LENGTH, COMMENT
FROM (
    SELECT wt.name AS WORK_TYPE, 
           w.name AS WORK_NAME, 
           LENGTH(w.comment) AS COMMENT_LENGTH, 
           w.comment AS COMMENT,
           RANK() OVER (PARTITION BY w.type ORDER BY LENGTH(w.comment) DESC) AS rank
    FROM work w
    JOIN work_type wt ON w.type = wt.id
    WHERE LENGTH(w.comment) > 0
) AS ranked_works
WHERE rank = 1
ORDER BY WORK_TYPE ASC, WORK_NAME ASC;

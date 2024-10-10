SELECT 
    a.name AS artist_name,
    lr.release_name,
    lr.release_year
FROM 
    artist a
JOIN (
    SELECT 
        acn.artist AS artist_id,
        r.name AS release_name,
        ri.date_year AS release_year
    FROM 
        artist_credit ac
    JOIN 
        artist_credit_name acn ON ac.id = acn.artist_credit
    JOIN 
        release r ON ac.id = r.artist_credit
    JOIN 
        release_info ri ON r.id = ri.release
    WHERE 
        ac.artist_count = 4
        AND ri.date_year IS NOT NULL
) lr ON lr.artist_id = a.id
WHERE 
    a.gender = 1 
    AND a.begin_date_year = 1991
ORDER BY 
    a.name, 
    lr.release_year DESC
LIMIT 3;

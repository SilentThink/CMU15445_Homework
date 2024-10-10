SELECT r.name AS RELEASE_NAME, MIN(ri.date_year) AS RELEASE_YEAR
FROM release r
JOIN artist_credit ac ON r.artist_credit = ac.id
JOIN artist_credit_name acn ON ac.id = acn.artist_credit
JOIN artist a ON acn.artist = a.id
JOIN release_info ri ON r.id = ri.release
JOIN area ar ON ri.area = ar.id
JOIN medium m ON r.id = m.release
JOIN medium_format mf ON m.format = mf.id
WHERE a.name = 'The Beatles'
  AND ar.name = 'United Kingdom'
  AND ri.date_year <= a.end_date_year
  AND mf.name = '12" Vinyl'
GROUP BY r.name
ORDER BY RELEASE_YEAR, r.name;

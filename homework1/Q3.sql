SELECT r.name AS RELEASE_NAME, a.name AS ARTIST_NAME, ri.date_year AS RELEASE_YEAR
FROM release r
JOIN artist_credit ac ON r.artist_credit = ac.id
JOIN artist_credit_name acn ON ac.id = acn.artist_credit
JOIN artist a ON acn.artist = a.id
JOIN release_info ri ON r.id = ri.release
JOIN medium m ON r.id = m.release
JOIN medium_format mf ON m.format = mf.id
WHERE mf.name = 'Cassette'
ORDER BY ri.date_year DESC, ri.date_month DESC, ri.date_day DESC, r.name ASC, a.name ASC
LIMIT 10;

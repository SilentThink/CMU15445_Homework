SELECT DISTINCT(artist.name) as NAME
FROM
	artist
JOIN
	artist_credit_name on artist.id=artist_credit_name.artist
JOIN
	artist_credit on artist_credit_name.artist_credit=artist_credit.id
WHERE
	artist_credit.name LIKE '%Pittsburgh Symphony Orchestra%' 
	and artist.name!='Pittsburgh Symphony Orchestra'
ORDER BY
	NAME ASC;
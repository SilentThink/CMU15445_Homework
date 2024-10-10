SELECT 
	CAST((floor(artist.begin_date_year /10)*10) AS int) || 's' as DECADE,
	COUNT(*) as NUM_ARTIST_GROUP
FROM
	artist
JOIN
	area on artist.area=area.id
JOIN
	artist_type ON artist.type=artist_type.id
WHERE
	area.name='United States' AND 
	artist_type.name='Group' AND
	artist.begin_date_year >= 1900 AND
	artist.begin_date_year <= 2023
GROUP BY
	decade
ORDER BY
	decade;
	
SELECT 
	artist.name as ARTIST_NAME,
	COUNT(artist_alias.name) as NUM_ALIASES,
	GROUP_CONCAT(artist_alias.name,', ') as COMMA_SEPARATED_LIST_OF_ALIASES
FROM
	artist
left JOIN
	artist_alias on artist.id=artist_alias.artist
WHERE
	artist.name like '%John'
	and artist.id not in (
        select 
            artist 
        from 
            artist_alias 
        where
            lower(artist_alias.name) like '%john%'
    )
	and artist_alias.name is NOT NULL
GROUP BY
	artist.id,artist.name
HAVING
	COUNT(artist_alias.name) > 0
ORDER BY
	artist.name	ASC,
	artist_alias.name ASC;
	
	
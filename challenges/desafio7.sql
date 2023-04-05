SELECT
	ar.artista AS artista,
    al.album AS album,
    COUNT(fl.usuario_id) AS pessoas_seguidoras
FROM
	artist AS ar
    JOIN albums AS al ON al.artista_id = ar.artista_id
    JOIN followers AS fl ON fl.artista_id = ar.artista_id
    GROUP BY artista, album
    ORDER BY pessoas_seguidoras DESC, artista, album
    ;
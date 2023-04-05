SELECT
 	ar.artista AS artista,
  al.album AS album

FROM
 	artist AS ar
  JOIN albums AS al ON al.artista_id = ar.artista_id
  WHERE ar.artista LIKE 'Elis Regina';
  SELECT 
  COUNT(DISTINCT songs.id_cancao) AS cancoes,
  COUNT(DISTINCT artist.artista) AS artistas,
  COUNT(DISTINCT albums.album) AS albuns
  FROM 
   songs,
   artist,
   albums;
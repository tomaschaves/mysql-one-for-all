  SELECT 
    us.nomeUsuario AS pessoa_usuaria,
    COUNT(rep.id_cancao) AS musicas_ouvidas,
    ROUND(SUM(so.duracao/60),2) AS total_minutos

  FROM 
    users as us
    JOIN reproductions AS rep ON us.usuario_id = rep.usuario_id
    JOIN songs AS so ON rep.id_cancao = so.id_cancao
    GROUP BY pessoa_usuaria
    ORDER BY pessoa_usuaria;
  
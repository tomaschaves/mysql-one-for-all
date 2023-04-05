SELECT 
  us.nomeUsuario AS pessoa_usuaria,
IF(YEAR(MAX(rep.data_reproducao)) > 2020, 'Ativa', 'Inativa') AS status_pessoa_usuaria

FROM 
  users as us
  JOIN reproductions AS rep ON us.usuario_id = rep.usuario_id
  GROUP BY pessoa_usuaria
  ORDER BY pessoa_usuaria;
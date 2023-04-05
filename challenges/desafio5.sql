SELECT
	S.cancoes AS cancao,
    COUNT(rep.id_cancao) as reproducoes
FROM
	songs AS S
    JOIN reproductions AS rep ON S.id_cancao = rep.id_cancao
    GROUP BY cancao
    ORDER BY reproducoes DESC, cancao ASC LIMIT 2;
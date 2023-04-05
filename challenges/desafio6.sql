SELECT
    MIN(valor_plano) AS faturamento_minimo,
    MAX(valor_plano) AS faturamento_maximo,
    ROUND(AVG(valor_plano), 2) AS faturamento_medio,
    SUM(valor_plano) AS faturamento_total
    
FROM
	planos AS pl
    JOIN users AS us ON us.id_plano = pl.id_plano;
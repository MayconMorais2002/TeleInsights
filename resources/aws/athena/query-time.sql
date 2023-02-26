WITH 
horario AS (
    SELECT 
        *, 
        CAST(date_format(from_unixtime("date"),'%Y-%m-%d %H:%i:%s') AS timestamp) AS tempo
    FROM "telegram" 
),
hora AS (
    SELECT
        *,
        EXTRACT(hour FROM tempo) AS horas,
        EXTRACT(dow FROM tempo) AS dias_da_semana,
        EXTRACT(week FROM tempo) AS numero_da_semana
    FROM horario
)
SELECT
    horas,
    dias_da_semana,
    numero_da_semana,
    count(1) AS "Quantidade de Mensagens" 
FROM hora
GROUP BY
    horas,
    dias_da_semana,
    numero_da_semana
ORDER BY
    numero_da_semana,
    dias_da_semana

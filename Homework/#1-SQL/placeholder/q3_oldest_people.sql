SELECT name, (died - born) AS age
FROM people
WHERE born >= 1900 AND (died IS NOT NULL)

UNION

SELECT name, (2022 - born) AS age
FROM people
WHERE born >= 1900 AND (died IS NULL)

ORDER BY age DESC, name ASC
LIMIT 20;

SELECT name, COUNT(*) AS cnt
FROM people
JOIN crew
ON people.person_id = crew.person_id
GROUP BY name
ORDER BY cnt DESC
LIMIT 20;

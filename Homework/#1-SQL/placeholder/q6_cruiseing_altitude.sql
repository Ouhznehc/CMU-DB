SELECT primary_title, votes
FROM titles
JOIN ratings
ON titles.title_id = ratings.title_id
JOIN crew
ON titles.title_id = crew.title_id
JOIN people
ON people.person_id = crew.person_id
WHERE name LIKE '%Cruise%' AND born = 1962
ORDER BY votes DESC
LIMIT 10;

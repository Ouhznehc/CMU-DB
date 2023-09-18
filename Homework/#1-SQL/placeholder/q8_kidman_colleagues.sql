WITH works_with_nk AS(
  SELECT title_id 
  FROM crew
  JOIN people
  ON people.person_id = crew.person_id
  WHERE name = 'Nicole Kidman' AND born = 1967
)

SELECT DISTINCT name
FROM people
JOIN crew
ON crew.person_id = people.person_id
JOIN works_with_nk
ON works_with_nk.title_id = crew.title_id
WHERE category = 'actor' OR category = 'actress'
ORDER BY name;
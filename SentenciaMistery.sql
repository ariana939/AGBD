SELECT *
FROM crime_scene_report
WHERE type = "murder" AND city like "sql city" AND date = 20180115

SELECT *
FROM person
WHERE address_street_name like "Northwestern Dr"
ORDER BY address_number DESC;

SELECT *
FROM person
WHERE name like "Annabel%" AND address_street_name like "Franklin ave"

SELECT *
FROM interview iw join person p
ON iw.person_id = p.id
WHERE address_street_name like "Northwestern Dr" 
ORDER BY address_number DESC;

SELECT *
FROM interview iw join person p
ON iw.person_id = p.id
WHERE name like "Annabel%" AND address_street_name like "Franklin ave"

SELECT *
FROM drivers_license
WHERE plate_number LIKE "%H42W%"
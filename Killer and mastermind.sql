--step 1 - extracting the crime scene report

SELECT * FROM Crime_scene_report
WHERE date = '20180115'
AND city = 'SQL City'


--step 2 - finding the witness statements 

--finding the first witness
SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number desc
LIMIT 1

--finding the second witness
SELECT * FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE '%nnabel%'

--step 3 - finding the interviews

--witness 14887
SELECT * FROM interview
WHERE person_id = 14887

--witness 16371
SELECT * FROM interview
WHERE person_id = 16371

--step 3 - finding the murderer
SELECT * FROM get_fit_now_member 
as gfnm
INNER JOIN 
person as p ON gfnm.person_id = p.id
INNER JOIN 
drivers_license as dl ON p.license_id = dl.id
WHERE membership_status = 'gold'
AND dl.plate_number LIKE '%H42W%'

--step 4 - finding the mastermind
//getting the witness statement 
SELECT * FROM interview
WHERE person_id = 67318

--finding the mastermind 
 SELECT *
FROM drivers_license as dl
INNER JOIN person as p on dl.id = p.license_id
INNER JOIN facebook_event_checkin as fec
ON p.id = fec.person_id
WHERE hair_color = 'red'
AND height >=65
AND height <67
AND car_make = 'Tesla'
AND car_model ='Model S' 
AND date = 20171206
and gender = 'female' 

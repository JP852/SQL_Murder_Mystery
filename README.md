# SQL_Murder_Mystery

![image](https://github.com/JP852/SQL_Murder_Mystery/assets/142391590/67675b5e-7ffa-4bd4-8a3d-4b10b95f47b7)


#### Link to Challenge

https://mystery.knightlab.com/

#### SQL Techniques Used

- Table Joins
- Where Clause
- Order By
- Limit

## Steps

### Step 1: Extracting the Crime Scene Report

```
SELECT 
    * 
        FROM Crime_scene_report
            WHERE date = '20180115'
            AND city = 'SQL City'

```
### Step 2: Finding the Witness Statements

Finding the first witness

```

SELECT 
    * FROM person
        WHERE address_street_name = 'Northwestern Dr'
            ORDER BY address_number desc
                LIMIT 1

```

Finding the second witness

```

SELECT 
    * FROM person
        WHERE address_street_name = 'Franklin Ave'
        AND name LIKE '%nnabel%'

```
### Step 3: Finding the Interviews

Witness 14887

```
 
SELECT 
    * FROM interview
        WHERE person_id = 14887

```

Witness 16371

```
 
SELECT 
    * 
        FROM interview
            WHERE person_id = 16371
```
### Step 4: Finding the Murderer

```

SELECT 
    * FROM get_fit_now_member as gfnm
        INNER JOIN person as p 
        ON gfnm.person_id = p.id
            INNER JOIN drivers_license as dl ON p.license_id = dl.id
                WHERE membership_status = 'gold'
                AND dl.plate_number LIKE '%H42W%'
```
### Step 5: Finding the Mastermind

```

 SELECT 
     *
        FROM drivers_license as dl
            INNER JOIN person as p 
            on dl.id = p.license_id
                INNER JOIN facebook_event_checkin as fec
                ON p.id = fec.person_id
                    WHERE hair_color = 'red'
                    AND height >=65
                    AND height <67
                    AND car_make = 'Tesla'
                    AND car_model ='Model S' 
                    AND date = 20171206
                    and gender = 'female' 
```









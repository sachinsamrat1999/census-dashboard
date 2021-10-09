--sql query for maintain data fro census 2011

-- first selecting all the data from female report
select* from female_census

-- second selecting all the data from male report
select* from male_census

--joining all the data from female and male report

select f.District_code,f.State_name,f.District_name,f.Population, f.Female,f.Female_Literate, m.Male, m.Male_Literate  from female_census as f
full outer join male_census as m
on f.District_code=m.District_code

--creating new coloum in the table for the literacy rate of the district

ALTER TABLE census
add literacy_rate float


select * from census

-- feeling the data in the literacy rate in the coloumn

UPDATE census
SET literacy_rate = Literate*100/Population

--creating coloumn for the illiterate person

ALTER TABLE census
add illitrate float

--updating data in illiterate coloumn in the table

UPDATE census
SET illitrate = Population-Literate

--selecting literacy rate sate wise

select distinct(State_name),round(avg(literacy_rate),2) as state_literacy from census
group by State_name

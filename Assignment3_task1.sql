Create table Patients_RLS(
patient_id number,
name varchar,
address varchar,
region varchar,
disease varchar,
AdmissionDate date,
DischargeDate date
);

insert into Patients_RLS values(10,'Vimala','Hyderabad','south','cold','2024-10-11','2024-10-15')
insert into Patients_RLS values(11,'Rani','DL','north','fever','2024-11-11','2024-11-15')
insert into Patients_RLS values(12,'Rambha','UP','east','cancer','2024-8-11','2024-10-15')
insert into Patients_RLS values(13,'Santhosh','HP','west','pain','2024-9-11','2024-10-15')
insert into Patients_RLS values(14,'Ved','AP','south','fever','2024-7-11','2024-7-15')
insert into Patients_RLS values(15,'Kumar','HP','east','fever','2024-7-11','2024-7-15')
insert into Patients_RLS values(16,'Aadvik','UP','west','fever','2024-7-11','2024-7-15')
insert into Patients_RLS values(17,'Arush','MP','north','fever','2024-7-11','2024-7-15')
insert into Patients_RLS values(18,'Ayan','AP','south','fever','2024-7-11','2024-7-15')
insert into Patients_RLS values(19,'Rinky','AP','North','fever','2024-7-11','2024-7-15')
insert into Patients_RLS values(20,'Rohit','AP','North','fever','2024-7-11','2024-7-15')
insert into Patients_RLS values(21,'sohan','AP','North','fever','2024-7-11','2024-7-15')

select * from Patients_RLS;

CREATE ROW ACCESS POLICY RegionPolicy

AS (region STRING) RETURNS BOOLEAN ->

  CASE 

    WHEN CURRENT_ROLE() = 'ANALYST' THEN region = 'North'

    ELSE FALSE

  END; 
  
  GRANT ROLE analyst TO USER VIMALA;
grant usage on database Vimala_db1 to analyst; 

grant usage on schema vimala_schema1 to analyst;

grant usage on warehouse compute_wh to analyst;
 
GRANT SELECT ON Patients_RLS TO ROLE analyst;

GRANT SELECT ON Patients_RLS TO ROLE public;

-- using the ANALYST role
 
USE ROLE analyst;


ALTER TABLE Patients_RLS ADD ROW ACCESS POLICY RegionPolicy ON (region);
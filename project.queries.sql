SELECT * FROM BloodBanks WHERE state = 'Maharashtra';


SELECT state, COUNT(*) AS total_blood_banks FROM BloodBanks GROUP BY state;


SELECT id, name, city FROM BloodBanks WHERE contact_number IS NULL OR contact_number = '';


SELECT name, city FROM BloodBanks WHERE apheresis_services = TRUE;


SELECT id, name, latitude, longitude FROM BloodBanks WHERE latitude IS NULL OR longitude IS NULL;


SELECT name, city FROM BloodBanks WHERE apheresis_services = FALSE AND blood_component_availability = FALSE;


SELECT state, COUNT(*) AS blood_bank_count FROM BloodBanks GROUP BY state HAVING blood_bank_count < 5;


SELECT name, ownership_type FROM BloodBanks WHERE ownership_type = 'Private';


SELECT pincode, COUNT(*) AS bank_count FROM BloodBanks GROUP BY pincode ORDER BY bank_count DESC LIMIT 10;


SELECT id, name FROM BloodBanks WHERE (contact_number IS NULL OR contact_number = '') AND (email IS NULL OR email = '');


SELECT COUNT(*) AS gov_blood_banks FROM BloodBanks WHERE ownership_type = 'Government';


SELECT city, COUNT(*) AS total_banks 
FROM BloodBanks 
GROUP BY city 
ORDER BY total_banks DESC 
LIMIT 3;


SELECT state, city, COUNT(*) AS bank_count,
       RANK() OVER (PARTITION BY state ORDER BY COUNT(*) DESC) AS city_rank
FROM BloodBanks
GROUP BY state, city;


SELECT id, name, city 
FROM BloodBanks b 
WHERE apheresis_services = TRUE 
      AND city NOT IN (SELECT city FROM BloodBanks WHERE apheresis_services = FALSE);


SELECT state, 
       SUM(CASE WHEN ownership_type = 'Private' THEN 1 ELSE 0 END) AS private_banks,
       COUNT(*) AS total_banks,
       (SUM(CASE WHEN ownership_type = 'Private' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS private_percentage
FROM BloodBanks
GROUP BY state
HAVING private_percentage > 50;

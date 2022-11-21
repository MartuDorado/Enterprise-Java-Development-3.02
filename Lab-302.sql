-- Exercise 2
DROP SCHEMA IF EXISTS airline;
CREATE SCHEMA airline;
USE airline;

CREATE TABLE customer (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(60),
    status ENUM('None', 'Silver', 'Gold'),
    mileage INT,
    PRIMARY KEY (id)
);

CREATE TABLE aircraft (
    model VARCHAR(60),
    seats INT,
	PRIMARY KEY (model)
);

CREATE TABLE flight_info (
	flight_number VARCHAR(5),
    mileage INT,
    PRIMARY KEY (flight_number)
);

CREATE TABLE flight (
	id INT NOT NULL AUTO_INCREMENT,
	customer_id INT NOT NULL,
    aircraft_model VARCHAR(60),
    flight_id VARCHAR(5),
    PRIMARY KEY (id),
	CONSTRAINT FOREIGN KEY (customer_id) REFERENCES customer(id),
    CONSTRAINT FOREIGN KEY (aircraft_model) REFERENCES aircraft(model),
   CONSTRAINT FOREIGN KEY (flight_id) REFERENCES flight_info(flight_number)
);

INSERT INTO customer (name, status, mileage) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO aircraft (model, seats) VALUES
('Boeing747', 400),
('AirbusA330', 236),
('Boeing777', 264);

INSERT INTO flight_info (flight_number, mileage) VALUES
('DL143', 135),
('DL122', 4370),
('DL53', 2078),
('DL222', 1765),
('DL37', 531);


INSERT INTO flight (customer_id, aircraft_model, flight_id) VALUES
(1,'Boeing747','DL143'),
(1,'AirbusA330','DL122'),
(2,'AirbusA330','DL122'),
(3,'AirbusA330','DL122'),
(3,'Boeing777','DL53'),
(4,'Boeing747','DL143'),
(3,'Boeing777','DL222'),
(5,'Boeing747','DL143'),
(6,'Boeing777','DL222'),
(7,'Boeing777','DL222'),
(5,'AirbusA330','DL122'),
(4,'Boeing747','DL37'),
(8,'Boeing777','DL222');

SELECT count(distinct flight_id) AS diferents_flights FROM flight;
SELECT avg(mileage) FROM flight_info;
SELECT avg(seats) FROM aircraft;
SELECT status, avg(mileage) FROM customer group by status;
SELECT status, MAX(mileage) FROM customer group by status;
select count(model) as boeing from aircraft where model like("boeing%");
select flight_number from flight_info where mileage between 300 and 2000;

select c.status, avg(fi.mileage) from flight f
join customer c on  f.customer_id = c.id
JOIN flight_info fi
ON f.flight_id = fi.flight_number
GROUP BY c.status;

select c.status, aircraft_model, count(aircraft_model)as cuenta from flight f
join customer c on  f.customer_id = c.id
where c.status ="Gold"
GROUP BY f.aircraft_model order by cuenta desc limit 1;

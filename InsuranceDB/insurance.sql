CREATE DATABASE insurance;
USE insurance; 

CREATE TABLE person (
driver_id VARCHAR(10) PRIMARY KEY,
name VARCHAR(50),
address VARCHAR(100)
); 

CREATE TABLE car (
3
reg_num VARCHAR(10) PRIMARY KEY,
model VARCHAR(20),
year INT );
CREATE TABLE accident (
report_num INT PRIMARY KEY,
accident_date DATE,
location VARCHAR(100)
); 

CREATE TABLE owns (
driver_id VARCHAR(10),
reg_num VARCHAR(10),
PRIMARY KEY (driver_id, reg_num),
FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
FOREIGN KEY (reg_num) REFERENCES CAR(reg_num)
); 

CREATE TABLE participated (
driver_id VARCHAR(10),
reg_num VARCHAR(10),
report_num INT,
damage_amount INT,
PRIMARY KEY (driver_id, reg_num, report_num),
FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
FOREIGN KEY (reg_num) REFERENCES CAR(reg_num),
FOREIGN KEY (report_num) REFERENCES ACCIDENT(report_num)
);
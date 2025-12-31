CREATE DATABASE supplier;
USE supplier; 

CREATE TABLE supplier (
sid INT PRIMARY KEY,
sname VARCHAR(100),
city VARCHAR(50)
);
CREATE TABLE parts (
pid INT PRIMARY KEY,
pname VARCHAR(50),
color VARCHAR(20)
); 

CREATE TABLE catalog (
sid INT,
pid INT,
cost DECIMAL(10,2),
PRIMARY KEY (sid, pid),
FOREIGN KEY (sid) REFERENCES SUPPLIER(sid),
FOREIGN KEY (pid) REFERENCES PARTS(pid)
); 

INSERT INTO supplier (sid, sname, city) VALUES
(1, 'Acme Widget Supplier', 'Bengaluru'),
(2, 'Global industries', 'Chennai'),
(3, 'National Parts Co', 'Delhi'),
(4, 'Reliable Supplies', 'Mumbai');

INSERT INTO parts (pid, pname, color) VALUES
(101, 'Bolt', 'Red'), 
(102, 'Nut', 'Green'),
(103, 'Screw', 'Red'),
(104, 'Washer', 'Blue'),
(105, 'Cog', 'Red'); 

INSERT INTO catalog (sid, pid, cost) VALUES
(1, 103, 10.00),
(1, 101, 12.50),
(2, 101, 11.00),
(2, 104, 9.50),
(3, 102, 7.75),
(3, 105, 15.00),
(4, 103, 8.00),
(4, 104, 9.75); 

SELECT p.pname
FROM parts p, supplier s, catalog c
WHERE p.pid=c.pid AND s.sid=c.sid
GROUP BY p.pname;

SELECT s.sname
FROM supplier s, catalog c
WHERE s.sid=c.sid
GROUP BY s.sid
HAVING COUNT(DISTINCT c.pid)=(SELECT COUNT(pid) FROM catalog);

SELECT s.sname
FROM supplier s,catalog c, parts p
WHERE s.sid=c.sid AND p.pid=c.pid AND p.color= 'Red'
GROUP BY s.sname; 

SELECT p.pname
FROM parts p, catalog c, supplier s
WHERE p.pid=c.pid AND c.sid=s.sid AND s.sname= 'Acme Widget Supplier'; 

SELECT s.sid
FROM supplier s, parts p, catalog c
WHERE s.sid=c.sid AND p.pid=c.pid AND c.cost > (SELECT AVG(c.cost) FROM
catalog c WHERE c.pid=p.pid GROUP BY c.pid); 

SELECT s.sname, p.pname
FROM supplier s,catalog c, parts p
WHERE s.sid=c.sid AND c.pid=p.pid AND c.cost = (SELECT MAX(c.cost) FROM
catalog c WHERE c.pid=p.pid GROUP BY c.pid); 
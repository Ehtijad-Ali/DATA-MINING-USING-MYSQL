create database mydemo_final;

use mydemo_final;

show tables;

CREATE TABLE dataofcustomer
   (
       custid VARCHAR(6)  PRIMARY KEY,
       fname VARCHAR(50),
       mname VARCHAR(30),
       ltname VARCHAR(30),
       city VARCHAR(15),
       age int(10),
       mobileno VARCHAR(10),
       occupation VARCHAR(10),
       dob DATE
         
   );  
   
   show tables;
   
INSERT INTO dataofcustomer VALUES('C00001','Ehtijad','ali','Shah','Thoi','21','9543198345','Service','2002-12-06');
INSERT INTO dataofcustomer VALUES('C00002','Muzafar','Ali','Shah','Thoi','22','9876532109','Service','1974-10-16');
INSERT INTO dataofcustomer VALUES('C00003','Sartaj',null,'Taj','Thoi','23','9765178901','Student','1981-09-26');
INSERT INTO dataofcustomer VALUES('C00004','Aliyan',null,'Shah','Thoi','21','9876532109','Housewife','1976-11-03');
INSERT INTO dataofcustomer VALUES('C00005','Hilbee','Badar','Muneem','Barkolti','22','8976523190','Service','1976-09-19');
INSERT INTO dataofcustomer VALUES('C00006','Fakhar',null,'Abass','Barkilti','20','7651298321','Student','1992-11-06');
INSERT INTO dataofcustomer VALUES('C00007','Sami','Ullah','Mughal','Barkilti','19','9875189761','Student','1981-09-06');
INSERT INTO dataofcustomer VALUES('C00008','Basharat',null,'Husain','Yasin','31','7954198761','Service','1975-12-03');
INSERT INTO dataofcustomer VALUES('C00009','Asair',null,'Malik','Thous','22','9856198761','Service','1973-05-22');
INSERT INTO dataofcustomer  VALUES('C00010','Azhar',null,'Qureshii','Thous','18','8765489076','Service','1976-07-12');

show tables;

select * from dataofcustomer;

select min(age) from dataofcustomer;

select fname from dataofcustomer where age = 18;
select max(age)  from dataofcustomer;
select fname from dataofcustomer where age = 90;

select  count(*) from dataofcustomer;


select count(age) as total_customer from dataofcustomer;

select count(age) as customer_from_Delhi from dataofcustomer where city ="Delhi";

select avg(age) as average_age from dataofcustomer;

select sum(age) as sum_of_age from dataofcustomer;
select count(fname),city from dataofcustomer group by city;

select count(fname),city from dataofcustomer group by city having count(fname)>2;

select count(fname),city from dataofcustomer group by city having count(fname)=2;

select count(fname),city from dataofcustomer group by city having count(fname)=1;

select count(fname),city from dataofcustomer group by city having count(fname)>2;
select count(fname),city from dataofcustomer group by city having count(fname)<2;

select count(fname),city from dataofcustomer group by city having count(fname)!=4;


CREATE TABLE customer
   (
       custid VARCHAR(6),
       fname VARCHAR(30),
       mname VARCHAR(30),
       ltname VARCHAR(30),
       city VARCHAR(15),
       mobileno VARCHAR(10),
       occupation VARCHAR(10),
       dob DATE,
      CONSTRAINT customer_custid_pk PRIMARY KEY(custid)   
   );   



CREATE TABLE account
   (
      acnumber VARCHAR(6),
      custid  VARCHAR(6),
      bid VARCHAR(6),
      opening_balance INT(7),
      aod DATE,
      atype VARCHAR(10),
      astatus VARCHAR(10),
      CONSTRAINT account_acnumber_pk PRIMARY KEY(acnumber),
      CONSTRAINT account_custid_fk FOREIGN KEY(custid) REFERENCES dataofcustomer(custid)
      
      
    );
    
INSERT INTO account VALUES('A00001','C00001','B00001',1000,'2012-12-15','Saving','Active');
INSERT INTO account VALUES('A00002','C00002','B00001',1000,'2012-06-12','Saving','Active');
INSERT INTO account VALUES('A00003','C00003','B00002',1000,'2012-05-17','Saving','Active');
INSERT INTO account VALUES('A00004','C00002','B00005',1000,'2013-01-27','Saving','Active');
INSERT INTO account VALUES('A00005','C00006','B00006',1000,'2012-12-17','Saving','Active');
INSERT INTO account VALUES('A00006','C00007','B00007',1000,'2010-08-12','Saving','Suspended');
INSERT INTO account VALUES('A00007','C00007','B00001',1000,'2012-10-02','Saving','Active');
INSERT INTO account VALUES('A00008','C00001','B00003',1000,'2009-11-09','Saving','Terminated');
INSERT INTO account VALUES('A00009','C00003','B00007',1000,'2008-11-30','Saving','Terminated');
INSERT INTO account VALUES('A00010','C00004','B00002',1000,'2013-03-01','Saving','Active');

show tables;


select * from account;


select count(*), astatus from account group by astatus  ;


 
select count(*), astatus from account group by astatus  having count(atype)=7;

select count(*) from account;



select count(*) from customer;
select count(*) from account;
select fname,acnumber from customer inner join account on customer.custid = account.custid;
select count(fname) from customer inner join account on customer.custid = account.custid;


select count(custid) from customer group by city;




select * from dataofcustomer;



select * from dataofcustomer where custid in (select custid from dataofcustomer where age>=45);

CREATE TABLE customer
   (
       custid VARCHAR(6)  PRIMARY KEY,
       fname VARCHAR(50),
       mname VARCHAR(30),
       ltname VARCHAR(30),
       city VARCHAR(15),
       age int(10),
       mobileno VARCHAR(10),
       occupation VARCHAR(10),
       dob DATE
         
   );  
   
drop table customer;
show tables;

INSERT INTO customer
SELECT * FROM  dataofcustomer
WHERE age>=45;


select * from customer;

select * from dataofcustomer;

UPDATE customer
SET age = 47
   WHERE age in  (select age from dataofcustomer where age=45);


DELETE FROM customer
   WHERE AGE IN (SELECT AGE FROM dataofCUSTOMER
      WHERE AGE >= 27 );
      
      
select * from dataofcustomer;
select * from democustomer;

SELECT * FROM customer
WHERE custid IN (SELECT  custid FROM customer 
                      WHERE age>25);
                      
                      
SELECT  custid,fname FROM customer 
                      WHERE age>25;
					
                    
select * from dataofcustomer;
  
select custid from account where custid = any (select custid from dataofcustomer where city = 'Delhi'); 

select custid from account where custid = all (select custid from dataofcustomer where city = 'Delhi'); 


select custid from dataofcustomer where city = 'Delhi';

select * from account;			


SELECT custid, fname,age,
CASE
    WHEN age > 30 THEN 'The age is greater than 30'
    WHEN age = 30 THEN 'The age is 30'
    ELSE 'The age is not group of 30'
END AS Age
FROM dataofcustomer;


SELECT fname, city, age
FROM dataofcustomer
ORDER BY
(CASE
    WHEN City IS NULL THEN "no city"
    ELSE City
END);
		

	
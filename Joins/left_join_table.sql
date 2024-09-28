create database my_demo_database2;

use my_demo_database2;

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

show tables;

CREATE TABLE branch
   (
    bid VARCHAR(6),
    bname VARCHAR(30),
    bcity VARCHAR(30),
    CONSTRAINT branch_bid_pk PRIMARY KEY(bid) 
   );

show tables;
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
      CONSTRAINT account_custid_fk FOREIGN KEY(custid) REFERENCES customer(custid),
      CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES branch(bid) 
    );
    
show tables;

select * from customer;

INSERT INTO customer VALUES('C00001','Ehtijad','ali','Shah','Thoi','9543198345','Service','2002-12-06');
INSERT INTO customer VALUES('C00002','Muzafar','Ali','Shah','Thoi','9876532109','Service','1974-10-16');
INSERT INTO customer VALUES('C00003','Sartaj',null,'Taj','Thoi','9765178901','Student','1981-09-26');
INSERT INTO customer VALUES('C00004','Aliyan',null,'Shah','Thoi','9876532109','Housewife','1976-11-03');
INSERT INTO customer VALUES('C00005','Hilbee','Badar','Muneem','Barkolti','8976523190','Service','1976-09-19');
INSERT INTO customer VALUES('C00006','Fakhar',null,'Abass','Barkilti','7651298321','Student','1992-11-06');
INSERT INTO customer VALUES('C00007','Sami','Ullah','Mughal','Barkilti','9875189761','Student','1981-09-06');
INSERT INTO customer VALUES('C00008','Basharat',null,'Husain','Yasin','7954198761','Service','1975-12-03');
INSERT INTO customer VALUES('C00009','Asair',null,'Malik','Thous','9856198761','Service','1973-05-22');
INSERT INTO customer  VALUES('C00010','Azhar',null,'Qureshii','Thous','8765489076','Service','1976-07-12');

select * from customer;


INSERT INTO branch VALUES('B00001','Thoi Harp','Thoi');
INSERT INTO branch VALUES('B00002','Thoi Harp','Thoi');
INSERT INTO branch VALUES('B00003','Thoi Draskin','Thoi');
INSERT INTO branch VALUES('B00004','Thoi Nialti','Thoi');
INSERT INTO branch VALUES('B00005','Barkolti Center','Barkoti');
INSERT INTO branch VALUES('B00006','Barkolti Main','Barkolti');
INSERT INTO branch VALUES('B00007','Center Yasin','Yasin');
INSERT INTO branch VALUES('B00008','Thous Center','Thous');
INSERT INTO branch VALUES('B00009','Thous Center','Thous');

select * from branch;

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

select * from account;

select count(custid) from customer;
select count(acnumber) from account;


SELECT * FROM account
LEFT JOIN customer
ON account.custid = customer.custid;

show tables;


SELECT * FROM customer
right JOIN account
ON  account.custid = customer.custid;


SELECT * FROM account
LEFT JOIN customer ON account.custid = customer.custid
UNION
SELECT * FROM account
RIGHT JOIN customer ON account.custid = customer.custid;

CREATE TABLE student
   (
    student_id VARCHAR(6),
    name VARCHAR(30),
    course_id VARCHAR(30),
    duration int(4)
   );
   
drop table student;
INSERT INTO student VALUES('1','Asif',2,4);
INSERT INTO student VALUES('2','Atul',1,4);
INSERT INTO student VALUES('1','Asif',1,4);
INSERT INTO student VALUES('2','Atul',3,4);
INSERT INTO student VALUES('5','Jasmin',1,4);
INSERT INTO student VALUES('6','Saima',1,4);

SELECT  s1.student_id, s1.name,s1.course_id  
FROM student AS s1, student s2  
WHERE s1.student_id=s2.student_id and s1.course_id<>s2.course_id ;  



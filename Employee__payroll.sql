-------UC1&2(DataBase Created and Employee_Payroll Created)------
CREATE TABLE Employee_Payroll(
id int NOT NULL IDENTITY(1,1),
Name varchar(100),
Salery decimal,
StartDate Date,
Primary KEY(id)
);
-------UC3(Insert into Table)------

INSERT INTO Employee_Payroll (Name,Salery,StartDate) values('Ashish',2000,'2022-03-02'),('Raj',2000,'2022-02-16'),('Manish',2000,'2022-03-04');
INSERT INTO Employee_Payroll  values('Arjun',2000,'2022-03-05'),('Astha',2000,'2022-04-16'),('Aman',2000,'2022-01-04');
INSERT INTO Employee_Payroll  values('Rabtha',2000,'2020-03-05'),('shanaya',2000,'2020-04-16'),('Anjali',2000,'2021-03-04');
-------UC4(Retrive Data from table)-----------

SELECT * FROM Employee_Payroll;
SELECT Name FROM Employee_Payroll;

-------UC5(Retrive data of Particular Employee)-----------
SELECT Salery FROM Employee_Payroll WHERE NAME='Ashish';
select * from Employee_Payroll WHERE StartDate BETWEEN CAST('2022-03-01' AS DATE) AND CAST('2022-03-28' AS DATE);

------------UC6(Ability To Add Gender)---------------------
Alter table Employee_Payroll add Gender varchar(2);
UPDATE Employee_Payroll SET Gender='F' where Name='Astha';
UPDATE Employee_Payroll SET Gender='F' where Name='Rabtha' ;
UPDATE Employee_Payroll SET Gender='F' where id>=7 and id<=9 ;
UPDATE Employee_Payroll SET Gender='M' where id>=1 and id<=4;
UPDATE Employee_Payroll SET Salery=80000 where  id%2=0 ;
UPDATE Employee_Payroll SET Salery=60000 where  id%2=1 ;

------------------UC7(Ability to find min, max, average,count)------------------
Select sum(Salery) from Employee_Payroll where Gender='M'; 
Select min(Salery) from Employee_Payroll where Gender='M'; 
Select max(Salery) from Employee_Payroll where Gender='M'; 
Select avg(Salery) from Employee_Payroll where Gender='M';
Select count(id) from Employee_Payroll where Gender='M';  
Select sum(Salery) from Employee_Payroll where Gender='F'; 
Select min(Salery) from Employee_Payroll where Gender='F'; 
Select max(Salery) from Employee_Payroll where Gender='F'; 
Select avg(Salery) from Employee_Payroll where Gender='F';
Select count(id) from Employee_Payroll where Gender='F';  
 
 -----------------UC8(Added phonenumber, address,department)--------------------
 
Alter table Employee_Payroll drop column PhoneNumber; 
Alter table Employee_Payroll drop column Department,column Address;
Alter table Employee_Payroll add PhoneNumber varchar(10) ,Address varchar(200) , Department varchar(50) default 'CSE';
 
------------------UC9 (Added  coloumn basic pay,taxable income ,deduction,Net pay)---------------------------
Alter table Employee_Payroll add BasicPay Decimal , Deduction decimal, TaxablePay decimal, Incometax Decimal, NetPay decimal;
update Employee_Payroll set PhoneNumber='707231604' ,Address='113/286',Department ='CSE'  where id =1;
update Employee_Payroll set PhoneNumber='80231604' ,Address='114/286',Department ='ESE'  where id =2;
update Employee_Payroll set PhoneNumber='907231604' ,Address='115/286',Department ='CHE'  where id =3
update Employee_Payroll set BasicPay=90000 where id =1;
update Employee_Payroll set BasicPay=80000 where id =2;
update Employee_Payroll set BasicPay=70000 where id =3;

------------------UC10 (Add info about tersa working in two different department)----------------------
INSERT INTO Employee_Payroll  values('Teresa',75000,'2020-03-05','F','1234567890','112/234','HR',60000,10000,2300,1200,7203);
INSERT INTO Employee_Payroll  values('Teresa',75000,'2020-03-05','F','1234567890','112/234','Marketing',60000,10000,2300,1200,7203);
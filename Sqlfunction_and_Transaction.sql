-------------SQL FUNCTIONS---------------------------------
Create Database FunctionExercise;
create table TEAM(
player_id int primary key identity(1,1),
player_name varchar(50),
player_post varchar(50)
)
insert into TEAM values('Kohli','Captain');
insert into TEAM values('Rohit','ViceCaptain');
insert into TEAM values('Hardik','Allrounder');
insert into TEAM values('Sachin','Mentor');
insert into TEAM values('Dhoni','Wicketkeeper');
select * from Team;

Create function Teaminfo()
returns table 
as
return(select * from TEAM)


Create function TeamCaptain()
returns Table 
as
return(select player_name from TEAM where player_post='Captain')

select * from TeamCaptain()

Alter table TEAM add  Jersyno decimal;

update  TEAM set Jersyno=7 where player_name='Kohli';

Create function Jersynum(@player_name varchar)
returns Table
as
return (select * from team where player_name=@player_name)

Create function Player_Name(@Jersyno int)
returns table 
as 
return (select * from team where Jersyno = @Jersyno)

select * from Player_Name(7)


-------------------------------------------------Transaction-------------------------------
  


  CREATE TABLE Product (  
 Product_id INT PRIMARY KEY,   
 Product_name VARCHAR(40),   
 Price INT,  
 Quantity INT  
)  

INSERT INTO Product VALUES(111, 'Mobile', 10000, 10),  
(112, 'Laptop', 20000, 15),  
(113, 'Mouse', 300, 20),  
(114, 'Hard Disk', 4000, 25),  
(115, 'Speaker', 3000, 20);  

select * from Product;


-- Start a new transaction    
BEGIN TRANSACTION  
-- SQL Statements  
 INSERT INTO Product VALUES(116, 'Headphone', 2000, 30)  
 UPDATE Product SET Price = 450 WHERE Product_id = 113  
 -- Commit changes   
COMMIT TRANSACTION  



-- Start a new transaction    
BEGIN TRANSACTION  
-- SQL Statements  
UPDATE Product SET Price = 5000 WHERE Product_id = 114  
DELETE FROM Product WHERE Product_id = 116  
--Undo Changes  
ROLLBACK TRANSACTION  
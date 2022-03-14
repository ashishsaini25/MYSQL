
--------------------------------UC1-Ability to create a Address Book Service DB--------------------------
use Address_Book_Service;
-----------------UC2-Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes------------------------
CREATE TABLE Address_Book_Table
(
	id int primary KEY IDENTITY(1,1),
	Firstname varchar(50) NOT NULL,
	Lastname varchar(50) NOT NULL,
	Address varchar(50) NOT NULL,
	City varchar(50),
	State varchar(50),
	Zip varchar(30) NOT NULL,
	Phonenumber varchar(50) NOT NULL,
	Email varchar(255) NOT NULL
);


SELECT * from Address_Book_Table;

----------------------------UC3-Ability to insert new Contacts to Address Book--------------------------


INSERT into Address_Book_Table values ('Anuj','Jadhav','Datta vadi','Mumbai','Maharashtra','421023','9878654565','anuj@gmail.com')

INSERT into Address_Book_Table values ('Mukesh','Kumar','Civil Line','Aurangabad','Maharashtra','421023','9878654565','Mukesh@gmail.com')

INSERT into Address_Book_Table values ('Sumit','Kale','Rajedra Nagar','Nashik','Maharashtra','421023','9878654565','Sumit@gmail.com')

INSERT into Address_Book_Table values ('Mahesh','Gore','GandhiPura','Mumbai','Maharashtra','411083','8878654565','Mahesh@gmail.com')

INSERT into Address_Book_Table values ('Ramesh','Ingole','Magalwarpeth','Pune','Maharashtra','431025','8278654565','Ramesh@gmail.com')

INSERT into Address_Book_Table values ('Yash','Wade','Malvadi','Pune','Maharashtra','401023','9988654565','Yash@gmail.com')

INSERT into Address_Book_Table values ('Rajesh','Ahute','Civil Line','Mallapur','Hyderabad','551023','7988654565','Rajesh@gmail.com')

INSERT into Address_Book_Table values ('Rahul','Mankar','Malvadi','Hi-Tech City','Hyderabad','501023','7788654565','rahul@gmail.com')

SELECT * from Address_Book_Table;

-------------------UC4-Ability to edit existing contact person using their name--------------------------------------------

UPDATE Address_Book_Table set zip = '432156', address = 'Vasant Nagar' where Firstname = 'Anuj'

SELECT * from Address_Book_Table;

--------------------------UC5-AAbility to delete a person using person's name-------------------

DELETE from Address_Book_Table where Firstname = 'Hitesh'

SELECT * from Address_Book_Table;

----------------------------UC6-Ability to Retrieve Person belonging to a City or State from the Address Book-----------------

SELECT * from Address_Book_Table where state = 'Maharashtra'

SELECT * from Address_Book_Table  where state = 'Hyderabad'

SELECT * from Address_Book_Table  where city = 'Pune'

SELECT * from Address_Book_Table  where city = 'Nashik'

SELECT * from Address_Book_Table  where city = 'Mumbai'

----------------------------UC7-Ability to understand the size of address book by City and State----------------

SELECT COUNT(*) from Address_Book_Table 

SELECT COUNT(*) from Address_Book_Table  where city = 'Mumbai'

SELECT COUNT(*) from Address_Book_Table  where city = 'Pune'

SELECT COUNT(*) from Address_Book_Table  where State = 'Maharashtra'


--------------UC8-Ability to retrieve entries sorted alphabetically by Person’s name for a given city-----------

SELECT * from Address_Book_Table  ORDER BY Firstname 

SELECT * from Address_Book_Table  GROUP BY city ORDER BY Firstname 

---------------UC9-Ability to identify each Address Book with name and type---------

ALTER TABLE Address_Book_Table  add add_name varchar(50), type varchar(50)

update Address_Book_Table  set add_name = 'Adr1', type = 'Friend' where id =2

update Address_Book_Table  set add_name = 'Adr1', type = 'Profession' where id =3

update Address_Book_Table  set add_name = 'Adr1', type = 'Family' where id =4

update Address_Book_Table  set add_name = 'Adr3', type = 'Friend' where id =5

update Address_Book_Table  set add_name = 'Adr1', type = 'Profession' where id =6

update Address_Book_Table  set add_name = 'Adr1', type = 'Friend' where id =7

update Address_Book_Table  set add_name = 'Adr2', type = 'Family' where id =8

update Address_Book_Table  set add_name = 'Adr2', type = 'Other' where id =9

SELECT * from Address_Book_Table 


-------------------UC10-Ability to get number of contact persons i.e. count by type------------------

SELECT COUNT(type) from Address_Book_Table 


-------------------UC11-Ability to add person to both Friend and Family------------------

INSERT into Address_Book_Table  values ('Arjun','Mali','ganeshPeth','Pune','Maharashtra','411033','8668986565','arjun@gmail.com','Adr3','Friend')

INSERT into Address_Book_Table  values ('Akshay','Gawai','DevPeth','Aurangabad','Maharashtra','432033','8665986565','akshay@gmail.com','Adr2','Family')

SELECT * from Address_Book_Table 


------------------------------UC12-Draw the ER Diagram------------------------------------------------------------------

CREATE TABLE  type
(
	type_id int PRIMARY KEY IDENTITY(1,1),
	type_name varchar(30) NOT NULL
);

SELECT * from type
SELECT * from Address_Book_Table 
DROP table type
alter table Address_Book_Table  DROP column type_id

INSERT into type values ('Friend')
INSERT into type values ('Profession')
INSERT into type values ('Family')
INSERT into type values ('Other')

ALTER TABLE Address_Book_Table  drop column type

CREATE TABLE address_book_service
(
	id int PRIMARY KEY IDENTITY(1,1),
	adr_id int FOREIGN KEY REFERENCES Address_Book_Table (id),
	type_id int FOREIGN KEY REFERENCES type(type_id)

);

SELECT * from type
SELECT * from address_book_service
SELECT * from address_book

SELECT Address_Book_Table .address, address_book_service.id,Address_Book_Table .Firstname From Address_Book_Table  INNER JOIN address_book_service on address_book_service.id = Address_Book_Table .id

SELECT * From Address_Book_Table  INNER JOIN address_book_service on address_book_service.id = Address_Book_Table .id
SELECT * From address_book_service RIGHT JOIN type on address_book_service.type_id = type.type_id
SELECT * From address_book_service LEFT JOIN type on address_book_service.type_id = type.type_id








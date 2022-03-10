use Payroll_service;

Create procedure spGetEmployee
As 
Begin
Try
Select * from Employee_Payroll;
End Try
Begin catch 
Select 
 ERROR_NUMBER() AS ErrorNumber,
ERROR_MESSAGE() AS ErrorMessage;
End Catch

Exec spGetEmployee 


------------------------------------------------------------


create procedure InsertEmployeeData(
@Name varchar(100),
@Salery decimal,
@StartDate date,
@Gender varchar(2),
@Phonenumber varchar(10),
@Address varchar(200),
@Department varchar(50),
@BasicPay Decimal,
@Deduction Decimal,
@TaxablePay Decimal,
@Incometax decimal,
@NetPay decimal
)
As
begin 
try
insert into Employee_Payroll values(@Name,@Salery,@StartDate,@Gender,@Phonenumber,@Address,@Department,@BasicPay,@Deduction,@TaxablePay,@Incometax,@NetPay)
End try
Begin catch 
Select 
 ERROR_NUMBER() AS ErrorNumber,
ERROR_MESSAGE() AS ErrorMessage;
End Catch

--------------------------------------------------------------------------------

Create procedure DeleteEmpByName
(
	@name varchar(50)
)
As 
Begin
Try
DELETE FROM employee_payroll where name = @name
End Try
Begin catch 
Select 
 ERROR_NUMBER() AS ErrorNumber,
ERROR_MESSAGE() AS ErrorMessage;
End Catch

Exec DeleteEmpByName @name = 'Ajay'

------------------------------------------------------------------------------------
Create procedure ShowEmpDataByName
(
	@name varchar(100)
)

As 
Begin
Try
Select * from employee_payroll where name = @name;
End Try
Begin catch 
Select 
 ERROR_NUMBER() AS ErrorNumber,
ERROR_MESSAGE() AS ErrorMessage;
End Catch


Exec ShowEmpDataByName @name = 'Ashish'

 ---------------------------------------------------------------------------------------------
 Create procedure ShowEmpDataById
(
	@id int
)

As 
Begin
Try
Select * from employee_payroll where id = @id;
End Try
Begin catch 
Select 
 ERROR_NUMBER() AS ErrorNumber,
ERROR_MESSAGE() AS ErrorMessage;
End Catch

Exec ShowEmpDataById @id = 3

--------------------------------------------------------------------------------------------------
Create procedure Department_detail
As
begin 
try
select id,Department from Employee_Payroll;
end try
Begin catch 
Select 
 ERROR_NUMBER() AS ErrorNumber,
ERROR_MESSAGE() AS ErrorMessage;
End Catch

Exec Department_detail
----------------------------------------------------------------------------------------------------------
Create procedure IncomeStatus
As
begin 
try
select Name,BasicPay,Deduction,TaxablePay,Incometax,NetPay from Employee_Payroll;
end try
Begin catch 
Select 
 ERROR_NUMBER() AS ErrorNumber,
ERROR_MESSAGE() AS ErrorMessage;
End Catch

Exec IncomeStatus

-----------------------------------------------------------------------------------------------------------
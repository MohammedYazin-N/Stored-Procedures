-- Mysql  Assignment 9

create database Workers_db;
use workers_db;
create table workers (Worker_Id INT, FirstName CHAR(25), LastName CHAR(25), 
Salary INT, JoiningDate DATETIME, Department CHAR(25));

INSERT INTO Workers (Worker_ID, FirstName, LastName, Salary, JoiningDate, Department)  
VALUES  
(101, 'Mohammed', 'Yazin', 50000.00, '2024-02-21 10:00:00', 'Data Science'),  
(102, 'Aisha', 'Khan', 55000.00, '2023-11-15 09:30:00', 'Machine Learning'),  
(103, 'Rahul', 'Sharma', 60000.00, '2022-06-10 08:45:00', 'Data Analytics'),  
(104, 'Sneha', 'Patel', 58000.00, '2023-09-25 10:15:00', 'Business Intelligence'),  
(105, 'John', 'Doe', 62000.00, '2021-12-01 11:00:00', 'Software Development'),  
(106, 'Emma', 'Wilson', 53000.00, '2023-07-20 09:00:00', 'Artificial Intelligence'),  
(107, 'Arjun', 'Verma', 57000.00, '2022-05-18 10:45:00', 'Cloud Computing'),  
(108, 'Sophia', 'Brown', 59000.00, '2024-01-10 08:30:00', 'Cyber Security'),  
(109, 'Ravi', 'Kumar', 61000.00, '2022-09-05 09:15:00', 'Data Engineering'),  
(110, 'Lisa', 'Anderson', 52000.00, '2023-03-22 10:30:00', 'Software Testing');  

select * from workers;


 ## Create a stored procedure that takes in IN parameters for
 all the columns in the Worker table 
 and adds a new record to the table and then invokes the procedure call.
 
DELIMITER #
CREATE PROCEDURE AddWorker(
in Id INT,
 in  First_Name CHAR(25), 
 in Last_Name CHAR(25),
 in Salary INT, 
 in Joining_Date DATETIME,
 in Department CHAR(25))
    
BEGIN
    INSERT INTO Workers (Worker_ID, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (ID,First_Name, Last_Name, Salary, Joining_Date, Department);
END #
DELIMITER ;

call Addworker (111,'usha','sajith',85000.00,'2023-03-24 10:55:00',"Data Analytics");
select * from workers;

## Write stored procedure takes in an IN parameter for WORKER_ID
 and an OUT parameter for SALARY. 
 It should retrieve the salary of the worker with the given ID 
 and returns it in the p_salary parameter. Then make the procedure call

DELIMITER #
create procedure get_salary(in id int, out p_salary int)

begin

select salary into  p_salary  FROM WORKERS where Worker_id=id;

end #

DELIMITER  ;

set @salary = 0;
call get_salary(111,@salary);

## Create a stored procedure that takes in IN parameters for WORKER_ID
 and DEPARTMENT. It should update the department of the worker
 with the given ID. Then make a procedure call.

DELIMITER ## 
Create procedure get_department(in ID int,in dept varchar(20) )
begin
update workers set department=dept  where Worker_id=id;
end ##
DELIMITER ## 

CALL GET_DEPARTMENT (103,"FOOD TECHNOLOGY");
food technology

## Write a stored procedure that takes in an IN parameter for DEPARTMENT
 and an OUT parameter for p_workerCount.
 It should retrieve the number of workers in the given department 
and returns it in the p_workerCount parameter. Make procedure call


DELIMITER ##
CREATE PROCEDURE get_workercount(in dept varchar(20),out p_workercount int ) 
begin
select count(*) INTO p_workercount from workers where department=dept;
end##
DELIMITER ;

call get_workercount('food technology',@count);
select @count get_workercount;

## Write a stored procedure that takes in an IN parameter
 for DEPARTMENT and an OUT parameter for p_avgSalary. 
 It should retrieve the average salary of all workers
 in the given department and returns it in the p_avgSalary parameter 
 and call the procedure.

DELIMITER ##
CREATE PROCEDURE avg_salary(in dept varchar(20),out p_avgsalary float ) 
begin
select avg(salary) INTO p_avgsalary from workers where department=dept;
end##
DELIMITER ;

call avg_salary ('food technology',@avg_);
select @avg_ p_avgsalary;



                      ##finish ;)
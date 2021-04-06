Use [examination system]
---(operations in Student Tabel)
--  First Insert In Student Tabel
Create PROC Inst_St @fname nvarchar(50),@lname nvarchar(50),@user_na nvarchar(50),@pass nvarchar(50),@email nvarchar(200),@face_book nvarchar(200),@linkedin nvarchar(200),@dept_id int,@role_type nvarchar(50)
as 
		insert into Student(st_fname,st_lname,userName,password,email,facebook,linkedin,dep_id,RoleType)
		values(@fname,@lname,@user_na,@pass,@email,@face_book,@linkedin,@dept_id,@role_type)

create trigger ins 
on Student
after insert 
as 
	select 'Insert Operation is done'

Inst_St 'Kotb','Mohamed','Kotb','1234','kotb@gmail.com',NULL,NULL,2,'ST'
Inst_St 'Haitham','Mohamed','haitham1','1234','haitham@gmail.com',NULL,NULL,2,'ST'
Inst_St 'Hager','Ahmed','hager2','1234','hager@gmail.com',NULL,NULL,2,'ST'
Inst_St 'Marlin','omar','marlin1','1234','marlin@gmail.com',NULL,NULL,3,'ST'
Inst_St 'Wafaa','sayed','wafaa1','1234','wafaa@gmail.com',NULL,NULL,3,'ST'


------------------------------------------

--- second operation Select Proc
create proc Getname_st @userName nvarchar(50),@pass nvarchar(50) ,@type nvarchar(50) output

as
	select @type=RoleType
	from Student
	where userName=@userName and password=@pass

declare @x nvarchar(50)
execute Getname_st ahmed,'1234',@x output
select @x 

--------------
---third operation Update 

Alter Proc update_st  @fname nvarchar(50),@lname nvarchar(50),@user_na nvarchar(50),@pass nvarchar(50),@email nvarchar(200),@face_book nvarchar(200),@linkedin nvarchar(200),@dept_id int,@role_type nvarchar(50)
As 
	begin 
		Update Student
			Set st_fname = @fname,  
			st_lname = @lname,
			userName=@user_na,
			password=@pass,
			facebook=@face_book,
			linkedin=@linkedin,
			dep_id=@dept_id,
			RoleType=@role_type
			where email=@email;
	end
return 0
                   
execute update_st 'Ashraf','Mohamed','ashraf','1234','ashraf@gmail.com',NULL,NULL,3,'ST'
-----------------------------------------
---fourth operation delete
Alter proc delete_st @email nvarchar(50)
As
	DELETE FROM Student
	WHERE email=@email;



execute delete_st 'marlin@gmail.com'
;
--------------------------------------------------------------------------------------------


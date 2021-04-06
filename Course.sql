Use [examination system]
---(operations in Course Tabel)
-- First Insert In COURSE Tabel
Create PROC Inst_cr @name_c nvarchar(50),@hours_cr float
as 
		insert into course (cr_name,cr_hours)
		values(@name_c,@hours_cr)

create trigger cr 
on course
after insert 
as 
	select 'Insert Operation is done'

execute Inst_cr 'Statistics',6;
execute Inst_cr 'Mathematics',8;
execute Inst_cr 'MachineLearnig',10;
execute Inst_cr 'BI',7;

---------------------------------
--second operation select
Alter proc select_cr @name_c nvarchar(50),@hours_cr float output,@ins_fname nvarchar(50)output,@ins_lname nvarchar(50)output,@top_name nvarchar(50) output
As
	select @hours_cr=cr_hours,@ins_fname=ins_fname,@ins_lname=ins_lname,@top_name=Topic_Name
	from course c inner join Topic t
	on c.cr_id=t.Cr_ID 
	inner join instructor i
	on c.cr_id=i.cr_id
	where cr_name=@name_c

declare  @f float,@g nvarchar(50),@h nvarchar(50),@j nvarchar(50)
execute select_cr 'Programming', @f output,@g output,@h output,@j output
select @f,@g,@h,@j
----------------------------------

select cr_hours,Topic_Name,ins_fname,ins_lname
from course c inner join Topic t
on c.cr_id=t.Cr_ID 
inner join instructor i
on c.cr_id=i.cr_id
where cr_name='Programming'

------------------------------------------------
---third operation Update
create Proc update_cr @cr_hours int, @name_cr nvarchar(50)
As 
	begin 
		Update course
			Set cr_hours = @cr_hours  
			where cr_name=@name_cr
	end
return 0

execute update_cr 10,'BI'
----------------------------------------------------
---fourth operation delete
Alter proc delete_cr @cr_name nvarchar(50)
As
	DELETE FROM course
	WHERE cr_name= @cr_name



execute delete_cr 'MachineLearnig'
;
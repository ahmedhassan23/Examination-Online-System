---(operations in Topic Tabel)
Use [examination system]
--first inseration

Create PROC Inst_topic @top_name nvarchar(50),@cr_id int
as 
		insert into Topic(Topic_Name,Cr_ID)
		values(@top_name,@cr_id)

create trigger ins_to 
on Topic
after insert 
as 
	select 'Insert Operation is done'

execute Inst_topic 'Clustering',3
execute Inst_topic 'Classification',3
execute Inst_topic 'BigData',4
execute Inst_topic 'Probability',5
execute Inst_topic 'Statistics',5
execute Inst_topic 'Mathematics 1',6
execute Inst_topic 'Mathematics 2',6
execute Inst_topic 'Supervised learning',7
execute Inst_topic 'Deeplearning',7
execute Inst_topic 'power BI',8
execute Inst_topic 'SQL server',8
--------------------------------------------
--select 
Alter proc select_topic ( @id_cr int ,@topic_name nvarchar(50) output
as

	select @topic_name=Topic_Name
	From Topic
	where Cr_ID=@id_cr

declare @topic nvarchar(50)
execute select_topic 2,@topic output
select @topic
------------------------------------------------------------
create proc select_topic2 @topic_name nvarchar (50) output
as
	select @topic_name=Topic_Name
	from Topic

declare @topic nvarchar(50)
execute select_topic2 @topic output
select @topic

----------------------------------------------------------
---Update
Alter proc update_topic @top_name nvarchar(50),@cr_id int,@top_name1 nvarchar(50)
AS
	begin 
	Upd
	ate Topic
		set @top_name=Topic_Name
		where Cr_ID=@cr_id and Topic_Name=@top_name1
	end
return 0
execute update_topic 'C#',1,'java'

------------------------------------------------------------
---Delete
create proc delete_top @top_name nvarchar(50)
As
	DELETE FROM Topic
	WHERE Topic_Name= @top_name


execute delete_top'SQL Server'
;
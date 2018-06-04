--一、导入Sale数据库(运行Test12_SaleDB.sql)，完成以下题目：
--创建存储过程p_SelProduct，逐行显示产品销售信息，内容包括产品编号、产品名称、销售日期、销售数量、销售金额，要求显示格式如下：
--产品编号 产品名称   销售日期    销售数量  销售金额
-- 00001    电视       2002-1-1    10        30000
--产品编号 产品名称   销售日期    销售数量  销售金额
-- 00002    空调       2006-1-2     5        10000
use sale
go

alter PROCEDURE p_SelProduct
AS
	DECLARE @prono varchar(5),@proname varchar(20),@saledate date,@quantity decimal(6,0),@sumprice decimal(8,2)
	DECLARE CrsCourse CURSOR 
	FOR 
		SELECT product.prono,proname,saledate,sum(quantity),sum(quantity)*price'销售金额'
		from product ,proout
		WHERE product.prono=proout.prono
		group by product.prono,proname,saledate,price

	--打开游标
	OPEN CrsCourse 
	--取得第一行数据
	FETCH NEXT FROM CrsCourse INTO @prono,@proname, @saledate,@quantity,@sumprice
	--通过判断@@FETCH_STATUS进行循环
	WHILE @@FETCH_STATUS=0 
	BEGIN
		PRINT '产品编号 产品名称   销售日期    销售数量  销售金额'
		print @prono+@proname+cast(@saledate as varchar(30))+cast(@quantity as varchar(30))+cast(@sumprice as varchar(30))
		--取得下一行数据
		 FETCH NEXT FROM CrsCourse INTO @prono,@proname, @saledate,@quantity,@sumprice
	END
	--关闭游标
	CLOSE CrsCourse
	--释放游标
	DEALLOCATE CrsCourse
GO


EXEC p_SelProduct
GO


--……
--二、导入XK数据库，完成下面操作
--1、使用游标按行查询所有姓王的同学的记录。
use Xk
go

alter PROCEDURE P_Print_wang
AS
	DECLARE CrsCourse CURSOR 
	FOR 
		SELECT StuNo,StuName from Student
		  WHERE StuName like '王%'
		  ORDER BY StuNo
	--打开游标
	OPEN CrsCourse 
	--取得第一行数据
	--通过判断@@FETCH_STATUS进行循环
	FETCH NEXT FROM CrsCourse 
	WHILE @@FETCH_STATUS=0 
	BEGIN
		
		--取得下一行数据
		 FETCH NEXT FROM CrsCourse 
	END
	--关闭游标
	CLOSE CrsCourse
	--释放游标
	DEALLOCATE CrsCourse
GO


EXEC P_Print_wang
GO





--2、将学号为‘01000008’同学的选课密码修改为‘88888888’，用游标完成。

DECLARE @stuno nvarchar(8)
DECLARE CrsCourse CURSOR 
	FOR 
		SELECT StuNo from student where stuno='01000008'
	--打开游标
	OPEN CrsCourse 
	--取得第一行数据
	--通过判断@@FETCH_STATUS进行循环
	FETCH NEXT FROM CrsCourse into @stuno
	WHILE @@FETCH_STATUS=0 
	BEGIN
		if(@stuno='01000008')
			UPDATE student SET Pwd='88888888' WHERE CURRENT OF CrsCourse
		--取得下一行数据
		FETCH NEXT FROM CrsCourse into @stuno
	END
	--关闭游标
	CLOSE CrsCourse
	--释放游标
	DEALLOCATE CrsCourse



--3、修改以上程序，能根据用户输入的学号，修改该学号同学的选课密码为用户输入的新密码。（要求：使用带游标的存储过程完成。）
go

create PROCEDURE xiugaimima( @stuno nvarchar(8) ,@mima nvarchar(8) )
AS
	DECLARE @stuno1 nvarchar(8)
	DECLARE CrsCourse CURSOR 
		FOR 
			SELECT StuNo from student 
		--打开游标
		OPEN CrsCourse 
		--取得第一行数据
		--通过判断@@FETCH_STATUS进行循环
		FETCH NEXT FROM CrsCourse into @stuno1
		WHILE @@FETCH_STATUS=0 
		BEGIN
			if(@stuno1=@stuno)
				UPDATE student SET Pwd=@mima WHERE CURRENT OF CrsCourse
			--取得下一行数据
			FETCH NEXT FROM CrsCourse into @stuno
		END
		--关闭游标
		CLOSE CrsCourse
		--释放游标
		DEALLOCATE CrsCourse
GO
drop PROCEDURE xiugaimima
go


EXEC xiugaimima '00000001','aaaaaaa'
GO

SELECT StuNo ,pwd ,stuname from student
go



--4、根据给定的同学的名字，逐行显示该同学的选课信息，内容包括课程编号、课程名称、学号、姓名。例如查询“陈雯”同学的选课信息。
create PROCEDURE chauxn( @stuname nvarchar(10) )
AS
	DECLARE CrsCourse CURSOR 
		FOR 
			SELECT course.couno,couname,student.stuno,stuname  from course ,student ,stucou where student.stuno=stucou.stuno and course.couno=stucou.couno and stuname=@stuname
		--打开游标
		OPEN CrsCourse 
		--取得第一行数据
		--通过判断@@FETCH_STATUS进行循环
		FETCH NEXT FROM CrsCourse 
		WHILE @@FETCH_STATUS=0 
		BEGIN
			--取得下一行数据
			FETCH NEXT FROM CrsCourse 
		END
		--关闭游标
		CLOSE CrsCourse
		--释放游标
		DEALLOCATE CrsCourse
GO

EXEC chauxn '林斌'
GO





--5、声明一个名为CrsStudent的游标，声明一个名为CrsStudent的游标，使其显示“00电子商务”班的所有学生学号和姓名信息，并逐行显示前三条学生信息.




--6、建立一个存储过程，利用游标求course表中某系（用户给定系代码）所开课程的最大报名人数，并把课程名称和最大报名人数作为输出变量返回给用户。 


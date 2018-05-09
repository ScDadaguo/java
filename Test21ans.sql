----实训二十二---------
--一、导入Sale数据库，完成下面操作。
--创建存储过程p_SelProduct，逐行显示产品销售信息，
--内容包括产品编号、产品名称、销售日期、销售数量、销售金额
USE Sale
GO
CREATE PROCEDURE P_SelProduct
AS
DECLARE @ProNo nvarchar(5),@ProName nvarchar(20),
	@SaleDate smallDateTime,@Quantity decimal(6,0),@Je decimal(8,2)
--定义游标
DECLARE Crs CURSOR 
FOR 
SELECT P.ProNo,ProName,SaleDate,Quantity,Je=Price*Quantity 
FROM Product P,ProOut PO
WHERE P.ProNo=PO.ProNo
ORDER BY SaleDate
--打开游标
OPEN Crs
--取得第一行数据
FETCH NEXT FROM Crs INTO @ProNo,@ProName,@SaleDate,@Quantity,@Je
--通过判断@@FETCH_STATUS控制循环
WHILE @@FETCH_STATUS=0 
BEGIN
	--第一种方法显示
  SELECT @ProNo '产品编号',@ProName'产品名称',
	 @SaleDate '销售日期',
	@Quantity'销售数量',@Je'销售金额'
--取得下一行数据
  FETCH NEXT FROM Crs INTO @ProNo ,@ProName,@SaleDate,@Quantity,@Je
END
--关闭游标
CLOSE Crs
--释放游标
DEALLOCATE Crs
GO

--验证存储过程
EXEC P_SelProduct 

--二、导入XK数据库，完成下面操作
--1、使用游标按行查询所有姓王的同学的记录
DECLARE CursorVar CURSOR       /*定义游标*/
FOR
	SELECT StuNo, stuName FROM Student WHERE stuName LIKE  '王%'
OPEN CursorVar                  /*打开游标*/
FETCH NEXT FROM CursorVar
WHILE @@FETCH_STATUS = 0
	FETCH NEXT FROM CursorVar  
 /*通过游标读行记录*/
CLOSE CursorVar
DEALLOCATE CursorVar   
  /*删除对游标的引用*/
GO

--2、将学号为‘01000008’同学的选课密码修改为‘88888888’，用游标完成。
declare @stuno varchar(8)
declare cur_student cursor
for
select stuno
from student
where stuno='01000008'
open cur_student
fetch next from cur_student into @stuno
update Student set Pwd='88888888' where current of cur_student
select * from student where stuno=@stuno
close cur_student
deallocate cur_student
go

--或者：
DECLARE @StuNo Nvarchar(8)
--声明游标
DECLARE Cur_Change_Pwd CURSOR
FOR
 SELECT StuNo
 FROM Student
 ORDER BY StuNo
--打开游标
OPEN Cur_Change_Pwd 
--读取游标位置的数据
FETCH NEXT FROM Cur_Change_Pwd INTO @StuNo
--SELECT @StuNo
--判断FETCH是否成功，如果成功
WHILE @@FETCH_STATUS=0
 BEGIN
  --判断@StuNo='01000008'？如果是，则
  IF @StuNo='01000008'
   BEGIN
    --修改游标位置的数据的Pwd
     UPDATE Student SET Pwd='88888888' WHERE CURRENT OF Cur_Change_Pwd
   END
   FETCH NEXT FROM Cur_Change_Pwd INTO @StuNo
 END
--步骤4：关闭游标
CLOSE Cur_Change_Pwd
--步骤5：释放游标
DEALLOCATE Cur_Change_Pwd
GO

--3、修改以上程序，能根据用户输入的学号，修改该学号同学的选课密码为用户输入的新密码
Alter proc p_1
@stuno varchar(8),@pwd varchar(10)
AS
IF exists(Select stuno from student where stuno=@stuno)
Begin
	declare cur_student cursor
	for
	select * from student where stuno=@stuno
	open cur_student
	fetch next from cur_student into @stuno
	update Student set Pwd=@pwd where current of cur_student
	close cur_student
	deallocate cur_student
end
else
	print '学号不存在，不能修改密码，请确认学号后，再修改密码'
GO

Exec p_1 '01000008','34257'
GO
--或者

CREATE PROC P_Change_Pwd
 @InputStuNo nvarchar(8),@NewPwd nvarchar(8)
AS
	DECLARE @StuNo Nvarchar(8)
	--声明游标
	DECLARE Cur_Change_Pwd CURSOR
	FOR
	 SELECT StuNo
	 FROM Student
	 ORDER BY StuNo
	--打开游标
	OPEN Cur_Change_Pwd 
	--读取游标位置的数据
	FETCH NEXT FROM Cur_Change_Pwd INTO @StuNo
	--SELECT @StuNo
	--判断FETCH是否成功，如果成功
	WHILE @@FETCH_STATUS=0
	 BEGIN
	  --判断@StuNo='01000008'？如果是，则
	  IF @StuNo=@InputStuNo
	   BEGIN
		--修改游标位置的数据的Pwd
		 UPDATE Student SET Pwd=@NewPwd WHERE CURRENT OF Cur_Change_Pwd
	   END
	   FETCH NEXT FROM Cur_Change_Pwd INTO @StuNo
	 END
	--步骤4：关闭游标
	CLOSE Cur_Change_Pwd
	--步骤5：释放游标
	DEALLOCATE Cur_Change_Pwd
GO

EXEC P_Change_Pwd @NewPwd='99999999',@InputStuNo='01000008'
GO
--4、根据给定的同学的名字，逐行显示该同学的选课信息，
--内容包括课程编号、课程名称、学号、姓名。
--例如查询“陈雯”同学的选课信息。
USE XK
GO
CREATE PROCEDURE PRO_Stucou_Cursor
@stuname nvarchar(10)
AS
	DECLARE Student_Cur  Cursor 
	FOR
		SELECT course.couno'课程编码',couname'课程名称',student.StuNo'学号',Stuname '学生姓名'
		FROM Student,course,stucou
		WHERE course.couno=stucou.couno 
			and stucou.stuno=student.stuno
            and stuname=@stuname
	--步骤2：打开游标
	OPEN Student_Cur 
	FETCH NEXT FROM  Student_Cur
	WHILE  @@FETCH_STATUS=0
		FETCH NEXT FROM  Student_Cur
	--步骤4：关闭游标
	CLOSE Student_Cur
	--步骤5：释放游标
	DEALLOCATE Student_Cur
GO
EXEC PRO_Stucou_Cursor '陈雯'
GO
----或者用以下语句也可完成(修改存储过程)。
ALter PROCEDURE PRO_Stucou_Cursor
@stuname nvarchar(10)
AS
	DECLARE @CouNo nvarchar(10),@CouName nvarchar(20),
			@StuNo nvarchar(8)
	DECLARE Student_Cur  Cursor 
	FOR
		SELECT course.couno,couname,student.StuNo
		FROM Student,course,stucou
		WHERE course.couno=stucou.couno 
			and stucou.stuno=student.stuno
            and stuname=@stuname
	--步骤2：打开游标
	OPEN Student_Cur 
	FETCH NEXT FROM  Student_Cur INTO @CouNo,@CouName,@StuNo
	WHILE  @@FETCH_STATUS=0
		begin
			SELECT @CouNo'课程编码',@CouName '课程名称',@StuNo'学号',@StuName '学生姓名'
			FETCH NEXT FROM  Student_Cur INTO @CouNo,@CouName,@StuNo
		end
	--步骤4：关闭游标
	CLOSE Student_Cur
	--步骤5：释放游标
	DEALLOCATE Student_Cur
GO
EXEC PRO_Stucou_Cursor '陈雯'
GO
--5、声明一个名为CrsStudent的游标，使其显示“00电子商务”班的所有学生学号和姓名信息，
--并逐行显示前三条学生信息.
Use XK
GO
DECLARE @num int=1
DECLARE CrsStudent CURSOR 
FOR 
 SELECT StuNo '学号',Stuname '学生姓名' 
 FROM Student,Class
 Where Student.ClassNo=Class.ClassNo and Classname='00电子商务'
--（2）使用OPEN语句打开游标
OPEN CrsStudent
--（3）使用FETCH语句，从游标中查询并返回数据行(用循环的方式控制输出三行)
FETCH NEXT FROM CrsStudent
While @@FETCH_STATUS=0 and @num<3
begin
FETCH NEXT FROM CrsStudent
select @num=@num+1
end
--（5）使用CLOSE语句关闭游标
CLOSE CrsStudent
--（6）使用DEALLOCATE语句释放游标
DEALLOCATE CrsStudent
GO
Use XK
GO
DECLARE CrsStudent CURSOR 
FOR 
 SELECT StuNo '学号',Stuname '学生姓名' 
 FROM Student,Class
 Where Student.ClassNo=Class.ClassNo and Classname='00电子商务'
--（2）使用OPEN语句打开游标
OPEN CrsStudent
--（3）使用FETCH语句，从游标中查询并返回数据行(不用循环的方式控制输出三行)
FETCH NEXT FROM CrsStudent
FETCH NEXT FROM CrsStudent
FETCH NEXT FROM CrsStudent
--（5）使用CLOSE语句关闭游标
CLOSE CrsStudent
--（6）使用DEALLOCATE语句释放游标
DEALLOCATE CrsStudent
GO

--6、建立一个存储过程，利用游标求course表中某系
--（用户给定系代码）所开课程的最大报名人数，
--并把课程名称和最大报名人数作为输出变量返回给用户。
USE XK
GO
CREATE PROCEDURE PRO_Course_Cursor
@DepartNo nvarchar(10),@CouName nvarchar(20)output,@Maxwillnum int output
AS
	DECLARE Student_Cur  Cursor 
	FOR
		SELECT CouName,WillNum
		FROM Course
		WHERE DepartNo=@DepartNo and WillNum=(SELECT MAX(WILLNUM) FROM Course where DepartNo=@DepartNo)
	--步骤2：打开游标
	OPEN Student_Cur 
	FETCH NEXT FROM  Student_Cur INTO @CouName,@Maxwillnum
	WHILE  @@FETCH_STATUS=0
		begin
			SELECT @DepartNo'系部编号',@CouName '课程名称',@Maxwillnum'最大报名数'
			FETCH NEXT FROM  Student_Cur INTO @CouName,@Maxwillnum
		end
	--步骤4：关闭游标
	CLOSE Student_Cur
	--步骤5：释放游标
	DEALLOCATE Student_Cur
GO
----方法二：
ALTER PROCEDURE PRO_Course_Cursor
@DepartNo nvarchar(10),@CouName nvarchar(20)output,@Maxwillnum int output
AS
	DECLARE @max decimal(8,0)
	Select @max=max(willnum) from course Where departno=@DepartNo  --先将最大报名人数保存
	DECLARE Student_Cur  Cursor 
	FOR
		SELECT CouName,WillNum
		FROM Course
		WHERE DepartNo=@DepartNo
	--步骤2：打开游标
	OPEN Student_Cur 
	FETCH NEXT FROM  Student_Cur INTO @CouName,@Maxwillnum
	WHILE  @@FETCH_STATUS=0
		begin
			if  @Maxwillnum=@max
			SELECT @DepartNo'系部编号',@CouName '课程名称',@Maxwillnum'最大报名数'
			FETCH NEXT FROM  Student_Cur INTO @CouName,@Maxwillnum
		end
	--步骤4：关闭游标
	CLOSE Student_Cur
	--步骤5：释放游标
	DEALLOCATE Student_Cur
GO

Declare @CouName nvarchar(20),@Maxwillnum int
Exec PRO_Course_Cursor '02',@CouName,@Maxwillnum
GO
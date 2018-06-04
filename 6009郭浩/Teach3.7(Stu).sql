--3.7 创建与使用游标
Use XK
Go
--思考1：查询信息技术类课程的信息，并按课程号排序。



--思考2：查询信息技术类课程的信息，按课程号排序，要求结果集按行显示。
--下面我们可以学习使用游标来完成此任务。
/*使用游标的步骤：
声明游标
打开游标 
读取游标位置的数据
修改或删除游标位置的数据—可以和其他T-SQL语句配合灵活使用
关闭游标（与打开游标配对）
释放游标（与声明游标配对，此时释放分配给游标的所有资源）
*/
----相关语句
--声明游标
DECLARE cursor_name CURSOR
[FORWORD_ONLY|SCROLL]
FOR select_statements
[FOR {READ ONLY|UPDATE}] 
--打开游标
OPEN cursor_name
--读取游标位置数据
FETCH [NEXT|PRIOR|FIRST|LAST]
FROM cursor 
--关闭游标
CLOSE cursor_name
--删除游标
DEALLOCATE cursor_name
-------------------------------
--1、创建基本游标
--【问题1】声明一个名为CrsCourse的游标，该游标从Course表中查询所有数据行并逐行显示；将课程编号为‘002’的数据行的限选人数修改为22。
--（1）使用DECLARE CURSOR语句声明游标，
USE Xk
GO
DECLARE CrsCourse CURSOR 
FOR 
	SELECT * FROM Course --ORDER BY CouNo
--（2）使用OPEN语句打开游标。
OPEN CrsCourse
--（3）使用FETCH语句，从游标中查询并返回数据行。
FETCH NEXT FROM CrsCourse   --001的课程
FETCH NEXT FROM CrsCourse   --002的课程
--（4）将当前数据行的限选人数修改为22
UPDATE Course SET LimitNum=22 WHERE CURRENT OF CrsCourse
--DELETE Course WHERE CURRENT OF CrsCourse   --删除当前数据行002的课程，此处暂不执行此语句，如果执行，请问会出现什么问题？
--（5）使用CLOSE语句关闭游标
CLOSE CrsCourse
--（6）使用DEALLOCATE语句释放游标
DEALLOCATE CrsCourse
GO

--2、创建使用变量的游标
--【问题2】在企业编程时，要求将FETCH的结果存放在变量里。
USE Xk
GO
--定义变量
DECLARE @CouNo nvarchar(3),@CouName nvarchar(30)
DECLARE CrsCourse2 CURSOR 
FOR 
	SELECT CouNo,CouName FROM Course ORDER BY CouNo
OPEN CrsCourse2
--使用FETCH将值存入变量,注意各变量的顺序、数据类型、数目与游标相一致。
FETCH NEXT FROM CrsCourse2 INTO @CouNo,@CouName
--利用变量打印输出
Select @CouName '课程名称',@CouNo '课程号'
--PRINT '课程号:'+@CouNo+'课程名称：'+@CouName

CLOSE CrsCourse2
DEALLOCATE CrsCourse2
GO

--3、创建使用@@FETCH_STATUS的游标遍历整个表
/*
FETCH成功与否，其值为int：
	0：FETCH语句成功
   －1: FETCH语句失败或此行不在结果集中
   －2：被提取的行不存在
*/
--【例】声明一个名为CrsCourse的游标，该游标从Course表中查询所有数据行。
Declare    CrsCourse   cursor
For
     select * from course
Open  CrsCourse
Fetch next from CrsCourse
While @@fetch_status=0
       
       fetch next from crscourse
Close crscourse
Deallocate crscourse
GO


--【问题解决思考2】查询信息技术类课程的信息，按课程号排序，要求结果集按行显示。
--步骤1：声明一个游标


--步骤2：打开游标

--步骤3：读取游标位置数据
--取得第一行数据

--通过判断@@FETCH_STATUS进行循环取数

--步骤4：关闭游标

--步骤5：释放游标



--【问题3】编写程序，使用游标逐行显示查询结果集（遍历）的每一行，使用@@FETCH_STATUS作为循环控制变量。
--定义游标
DECLARE @CouNo nvarchar(3),@CouName nvarchar(20)
DECLARE CrsCourse CURSOR 
FOR 
SELECT CouNo,CouName FROM Course ORDER BY CouNo
--打开游标
OPEN CrsCourse 
--取得第一行数据
FETCH NEXT FROM CrsCourse INTO @CouNo,@CouName 
--通过判断@@FETCH_STATUS进行循环
WHILE @@FETCH_STATUS=0 
BEGIN
  Select @CouNo '课程号',@CouName '课程名称'
  --PRINT '课程号:' + @CouNo+'课程名称：' + @CouName
  --取得下一行数据
  FETCH NEXT FROM CrsCourse INTO @CouNo,@CouName 
END
--关闭游标
CLOSE CrsCourse
--释放游标
DEALLOCATE CrsCourse
GO
--小结：游标适用于需要遍历结果集这样的处理过程。它允许对结果集中的每一行执行不同的操作，而不是整个结果集执行同一操作的情况。

--【练1】使用游标遍历Course表，输出报名人数最多的课程的信息（课程编号、课程名称、报名人数）





--【练2】使用游标遍历Course表，输出总报名人数最多的课程类的信息（课程类别、该类课程的总报名人数）




--4、创建带游标的存储过程
--在实际应用中，通常配合存储过程使用游标，游标特别适合需遍历表这样的处理过程。
--如果能合理地将客户端循环处理表的代码转换为存储过程并使用游标来处理，将大大提高数据的处理速度。
--思考：改写【问题3】程序为带有游标的存储过程。
CREATE PROCEDURE P_PrintCouName
AS
	DECLARE @CouNo nvarchar(3),@CouName nvarchar(20)
	DECLARE CrsCourse CURSOR 
	FOR 
		SELECT CouNo,CouName FROM Course ORDER BY CouNo
	--打开游标
	OPEN CrsCourse 
	--取得第一行数据
	FETCH NEXT FROM CrsCourse INTO @CouNo,@CouName 
	--通过判断@@FETCH_STATUS进行循环
	WHILE @@FETCH_STATUS=0 
	BEGIN
		PRINT '课程号:' + @CouNo+'课程名称：' + @CouName
		--取得下一行数据
		 FETCH NEXT FROM CrsCourse INTO @CouNo,@CouName 
	END
	--关闭游标
	CLOSE CrsCourse
	--释放游标
	DEALLOCATE CrsCourse
GO
EXEC P_PrintCouName
GO

----【练3】利用上面三种方式完成下面思考4的练习。
/*思考3：查询姓张同学的学号和姓名，按照姓名升序排序，要求显示为：
学号     姓名
02000011  张飞剑
02000046  张峰
………………
*/




/*思考4：逐行显示姓张同学的学号和姓名，要求显示如下格式：
学号      姓名
02000011  张飞剑
学号      姓名
02000046  张峰
*/
--方法一：创建基本游标的方式




--方法二：使用FETCH将值存入变量





--方法三：创建带游标的存储过程






----思考：滚动游标的使用：要求显示张姓同学的学号和姓名，并按要求显示某行信息。
Use Xk
go
--定义变量
Declare @StuNo char(8),@StuName char(8)
--步骤1：声明游标
DECLARE Student_Cursor Scroll Cursor 
FOR
  SELECT StuNo,StuName from Student
  WHERE StuName like '张%'
  ORDER BY StuNo
--步骤2：打开游标
OPEN Student_Cursor
--步骤3：读取数据
FETCH LAST From Student_Cursor          /*最后一行*/
FETCH PRIOR From Student_Cursor         /*前面一行*/
FETCH FIRST FROM Student_Cursor        /*第一行*/
FETCH ABSOLUTE 2 From Student_Cursor    /*绝对位置第2行*/
FETCH RELATIVE 3 From Student_Cursor     /*相对当前行的相对位置向下3行*/
FETCH RELATIVE -2 From Student_Cursor     /*相对当前行的向上2行*/
--步骤4：关闭游标
CLOSE Student_Cursor
--步骤5：释放游标
Deallocate Student_Cursor
GO

--5、游标的综合应用（选学）
--【问题4】在选课系统XK中，由于对每门课的上课人数进行了限制，而对报名人数没有进行限制，所以在Course表中会出现报名人数超过选课人数的情况，
--此时需要系统采取计算机随机抽取的方式公布选课结果。
USE XK
GO
CREATE PROCEDURE ChooesCourse
--定义抽第几志愿
@WillOrder INT 
AS
DECLARE @StuNo nvarchar(3),@CouNo nvarchar(3),@LimitNum INT,@ChooseNum INT,@WillNum INT,@I INT
--定义游标针对每一门课程抽取学生名单
DECLARE cCourse CURSOR FOR 
  SELECT CouNo,LimitNum,WillNum,ChooseNum FROM Course ORDER BY CouNo
--打开游标
OPEN cCourse
--循环读取游标（循环Course表）
FETCH NEXT FROM cCourse INTO @CouNo,@LimitNum,@WillNum,@ChooseNum
WHILE @@FETCH_STATUS=0
BEGIN
  --有足够名额则选中所有学生（如果该学生还没有报名成功的话）
  IF @LimitNum-@ChooseNum>=@WillNum  
    UPDATE StuCou SET State='选中' 
    WHERE WillOrder=@WillOrder AND CouNo=@CouNo AND StuNo NOT IN (SELECT StuNo FROM StuCou WHERE  State='选中')
  ELSE 
  --没有足够名额则取分配剩余名额
  BEGIN
    --待选学生名单
    DECLARE cStuCou CURSOR FOR 
      SELECT StuNo FROM StuCou 
      WHERE WillOrder=@WillOrder AND CouNo=@CouNo AND StuNo NOT IN (SELECT StuNo FROM StuCou WHERE  State='选中') 
      ORDER BY RandomNum
    OPEN cStuCou
    FETCH NEXT FROM cStuCou INTO @StuNo
    --设置循环变量@I，当小于剩余名额时（@I<=@LimitNum-@ChooseNum）继续分配
    SET @I=1
    WHILE @@FETCH_STATUS = 0 AND @I<=@LimitNum-@ChooseNum
    BEGIN 
      UPDATE StuCou SET State='选中' WHERE CURRENT OF cStuCou
      SET @I=@I+1
      FETCH NEXT FROM cStuCou INTO @CouNo
    END
    CLOSE cStuCou
    DEALLOCATE cStuCou
  END
  FETCH NEXT FROM cCourse INTO @CouNo,@LimitNum,@WillNum,@ChooseNum
END
--统计选中人数
UPDATE Course SET ChooseNum=(SELECT COUNT(*) FROM StuCou WHERE CouNo=Course.CouNo AND State='选中') 
CLOSE cCourse
DEALLOCATE cCourse
GO
--（4）测试执行
USE Xk
GO
--禁用触发器提高效率
ALTER TABLE StuCou DISABLE TRIGGER UpdateWillNum
GO
--对选课表的待抽名单（符合当前志愿号）赋随机值
UPDATE StuCou SET RandomNum=NEWID()
--抽第一志愿
EXEC ChooesCourse 1
GO
--抽第二志愿
EXEC ChooesCourse 2
GO
--抽第三志愿
EXEC ChooesCourse 3
GO
--抽第四志愿
EXEC ChooesCourse 4
GO
--抽第五志愿
EXEC ChooesCourse 5
GO
--恢复禁用的触发器
ALTER TABLE StuCou ENABLE TRIGGER UpdateWillNum
GO

SELECT * FROM Course
go


--【问题5】查询任何志愿都没有被选中的学生名单。（因为是随机抽取，所以执行结果会不一样。）
SELECT * FROM Student WHERE StuNo NOT IN
(
	SELECT DISTINCT StuNo FROM StuCou WHERE State='选中'
)
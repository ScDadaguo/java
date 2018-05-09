----ʵѵ��ʮ��---------
--һ������Sale���ݿ⣬������������
--�����洢����p_SelProduct��������ʾ��Ʒ������Ϣ��
--���ݰ�����Ʒ��š���Ʒ���ơ��������ڡ��������������۽��
USE Sale
GO
CREATE PROCEDURE P_SelProduct
AS
DECLARE @ProNo nvarchar(5),@ProName nvarchar(20),
	@SaleDate smallDateTime,@Quantity decimal(6,0),@Je decimal(8,2)
--�����α�
DECLARE Crs CURSOR 
FOR 
SELECT P.ProNo,ProName,SaleDate,Quantity,Je=Price*Quantity 
FROM Product P,ProOut PO
WHERE P.ProNo=PO.ProNo
ORDER BY SaleDate
--���α�
OPEN Crs
--ȡ�õ�һ������
FETCH NEXT FROM Crs INTO @ProNo,@ProName,@SaleDate,@Quantity,@Je
--ͨ���ж�@@FETCH_STATUS����ѭ��
WHILE @@FETCH_STATUS=0 
BEGIN
	--��һ�ַ�����ʾ
  SELECT @ProNo '��Ʒ���',@ProName'��Ʒ����',
	 @SaleDate '��������',
	@Quantity'��������',@Je'���۽��'
--ȡ����һ������
  FETCH NEXT FROM Crs INTO @ProNo ,@ProName,@SaleDate,@Quantity,@Je
END
--�ر��α�
CLOSE Crs
--�ͷ��α�
DEALLOCATE Crs
GO

--��֤�洢����
EXEC P_SelProduct 

--��������XK���ݿ⣬����������
--1��ʹ���α갴�в�ѯ����������ͬѧ�ļ�¼
DECLARE CursorVar CURSOR       /*�����α�*/
FOR
	SELECT StuNo, stuName FROM Student WHERE stuName LIKE  '��%'
OPEN CursorVar                  /*���α�*/
FETCH NEXT FROM CursorVar
WHILE @@FETCH_STATUS = 0
	FETCH NEXT FROM CursorVar  
 /*ͨ���α���м�¼*/
CLOSE CursorVar
DEALLOCATE CursorVar   
  /*ɾ�����α������*/
GO

--2����ѧ��Ϊ��01000008��ͬѧ��ѡ�������޸�Ϊ��88888888�������α���ɡ�
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

--���ߣ�
DECLARE @StuNo Nvarchar(8)
--�����α�
DECLARE Cur_Change_Pwd CURSOR
FOR
 SELECT StuNo
 FROM Student
 ORDER BY StuNo
--���α�
OPEN Cur_Change_Pwd 
--��ȡ�α�λ�õ�����
FETCH NEXT FROM Cur_Change_Pwd INTO @StuNo
--SELECT @StuNo
--�ж�FETCH�Ƿ�ɹ�������ɹ�
WHILE @@FETCH_STATUS=0
 BEGIN
  --�ж�@StuNo='01000008'������ǣ���
  IF @StuNo='01000008'
   BEGIN
    --�޸��α�λ�õ����ݵ�Pwd
     UPDATE Student SET Pwd='88888888' WHERE CURRENT OF Cur_Change_Pwd
   END
   FETCH NEXT FROM Cur_Change_Pwd INTO @StuNo
 END
--����4���ر��α�
CLOSE Cur_Change_Pwd
--����5���ͷ��α�
DEALLOCATE Cur_Change_Pwd
GO

--3���޸����ϳ����ܸ����û������ѧ�ţ��޸ĸ�ѧ��ͬѧ��ѡ������Ϊ�û������������
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
	print 'ѧ�Ų����ڣ������޸����룬��ȷ��ѧ�ź����޸�����'
GO

Exec p_1 '01000008','34257'
GO
--����

CREATE PROC P_Change_Pwd
 @InputStuNo nvarchar(8),@NewPwd nvarchar(8)
AS
	DECLARE @StuNo Nvarchar(8)
	--�����α�
	DECLARE Cur_Change_Pwd CURSOR
	FOR
	 SELECT StuNo
	 FROM Student
	 ORDER BY StuNo
	--���α�
	OPEN Cur_Change_Pwd 
	--��ȡ�α�λ�õ�����
	FETCH NEXT FROM Cur_Change_Pwd INTO @StuNo
	--SELECT @StuNo
	--�ж�FETCH�Ƿ�ɹ�������ɹ�
	WHILE @@FETCH_STATUS=0
	 BEGIN
	  --�ж�@StuNo='01000008'������ǣ���
	  IF @StuNo=@InputStuNo
	   BEGIN
		--�޸��α�λ�õ����ݵ�Pwd
		 UPDATE Student SET Pwd=@NewPwd WHERE CURRENT OF Cur_Change_Pwd
	   END
	   FETCH NEXT FROM Cur_Change_Pwd INTO @StuNo
	 END
	--����4���ر��α�
	CLOSE Cur_Change_Pwd
	--����5���ͷ��α�
	DEALLOCATE Cur_Change_Pwd
GO

EXEC P_Change_Pwd @NewPwd='99999999',@InputStuNo='01000008'
GO
--4�����ݸ�����ͬѧ�����֣�������ʾ��ͬѧ��ѡ����Ϣ��
--���ݰ����γ̱�š��γ����ơ�ѧ�š�������
--�����ѯ��������ͬѧ��ѡ����Ϣ��
USE XK
GO
CREATE PROCEDURE PRO_Stucou_Cursor
@stuname nvarchar(10)
AS
	DECLARE Student_Cur  Cursor 
	FOR
		SELECT course.couno'�γ̱���',couname'�γ�����',student.StuNo'ѧ��',Stuname 'ѧ������'
		FROM Student,course,stucou
		WHERE course.couno=stucou.couno 
			and stucou.stuno=student.stuno
            and stuname=@stuname
	--����2�����α�
	OPEN Student_Cur 
	FETCH NEXT FROM  Student_Cur
	WHILE  @@FETCH_STATUS=0
		FETCH NEXT FROM  Student_Cur
	--����4���ر��α�
	CLOSE Student_Cur
	--����5���ͷ��α�
	DEALLOCATE Student_Cur
GO
EXEC PRO_Stucou_Cursor '����'
GO
----�������������Ҳ�����(�޸Ĵ洢����)��
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
	--����2�����α�
	OPEN Student_Cur 
	FETCH NEXT FROM  Student_Cur INTO @CouNo,@CouName,@StuNo
	WHILE  @@FETCH_STATUS=0
		begin
			SELECT @CouNo'�γ̱���',@CouName '�γ�����',@StuNo'ѧ��',@StuName 'ѧ������'
			FETCH NEXT FROM  Student_Cur INTO @CouNo,@CouName,@StuNo
		end
	--����4���ر��α�
	CLOSE Student_Cur
	--����5���ͷ��α�
	DEALLOCATE Student_Cur
GO
EXEC PRO_Stucou_Cursor '����'
GO
--5������һ����ΪCrsStudent���α꣬ʹ����ʾ��00�������񡱰������ѧ��ѧ�ź�������Ϣ��
--��������ʾǰ����ѧ����Ϣ.
Use XK
GO
DECLARE @num int=1
DECLARE CrsStudent CURSOR 
FOR 
 SELECT StuNo 'ѧ��',Stuname 'ѧ������' 
 FROM Student,Class
 Where Student.ClassNo=Class.ClassNo and Classname='00��������'
--��2��ʹ��OPEN�����α�
OPEN CrsStudent
--��3��ʹ��FETCH��䣬���α��в�ѯ������������(��ѭ���ķ�ʽ�����������)
FETCH NEXT FROM CrsStudent
While @@FETCH_STATUS=0 and @num<3
begin
FETCH NEXT FROM CrsStudent
select @num=@num+1
end
--��5��ʹ��CLOSE���ر��α�
CLOSE CrsStudent
--��6��ʹ��DEALLOCATE����ͷ��α�
DEALLOCATE CrsStudent
GO
Use XK
GO
DECLARE CrsStudent CURSOR 
FOR 
 SELECT StuNo 'ѧ��',Stuname 'ѧ������' 
 FROM Student,Class
 Where Student.ClassNo=Class.ClassNo and Classname='00��������'
--��2��ʹ��OPEN�����α�
OPEN CrsStudent
--��3��ʹ��FETCH��䣬���α��в�ѯ������������(����ѭ���ķ�ʽ�����������)
FETCH NEXT FROM CrsStudent
FETCH NEXT FROM CrsStudent
FETCH NEXT FROM CrsStudent
--��5��ʹ��CLOSE���ر��α�
CLOSE CrsStudent
--��6��ʹ��DEALLOCATE����ͷ��α�
DEALLOCATE CrsStudent
GO

--6������һ���洢���̣������α���course����ĳϵ
--���û�����ϵ���룩�����γ̵������������
--���ѿγ����ƺ������������Ϊ����������ظ��û���
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
	--����2�����α�
	OPEN Student_Cur 
	FETCH NEXT FROM  Student_Cur INTO @CouName,@Maxwillnum
	WHILE  @@FETCH_STATUS=0
		begin
			SELECT @DepartNo'ϵ�����',@CouName '�γ�����',@Maxwillnum'�������'
			FETCH NEXT FROM  Student_Cur INTO @CouName,@Maxwillnum
		end
	--����4���ر��α�
	CLOSE Student_Cur
	--����5���ͷ��α�
	DEALLOCATE Student_Cur
GO
----��������
ALTER PROCEDURE PRO_Course_Cursor
@DepartNo nvarchar(10),@CouName nvarchar(20)output,@Maxwillnum int output
AS
	DECLARE @max decimal(8,0)
	Select @max=max(willnum) from course Where departno=@DepartNo  --�Ƚ��������������
	DECLARE Student_Cur  Cursor 
	FOR
		SELECT CouName,WillNum
		FROM Course
		WHERE DepartNo=@DepartNo
	--����2�����α�
	OPEN Student_Cur 
	FETCH NEXT FROM  Student_Cur INTO @CouName,@Maxwillnum
	WHILE  @@FETCH_STATUS=0
		begin
			if  @Maxwillnum=@max
			SELECT @DepartNo'ϵ�����',@CouName '�γ�����',@Maxwillnum'�������'
			FETCH NEXT FROM  Student_Cur INTO @CouName,@Maxwillnum
		end
	--����4���ر��α�
	CLOSE Student_Cur
	--����5���ͷ��α�
	DEALLOCATE Student_Cur
GO

Declare @CouName nvarchar(20),@Maxwillnum int
Exec PRO_Course_Cursor '02',@CouName,@Maxwillnum
GO
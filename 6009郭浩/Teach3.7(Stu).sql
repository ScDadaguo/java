--3.7 ������ʹ���α�
Use XK
Go
--˼��1����ѯ��Ϣ������γ̵���Ϣ�������γ̺�����



--˼��2����ѯ��Ϣ������γ̵���Ϣ�����γ̺�����Ҫ������������ʾ��
--�������ǿ���ѧϰʹ���α�����ɴ�����
/*ʹ���α�Ĳ��裺
�����α�
���α� 
��ȡ�α�λ�õ�����
�޸Ļ�ɾ���α�λ�õ����ݡ����Ժ�����T-SQL���������ʹ��
�ر��α꣨����α���ԣ�
�ͷ��α꣨�������α���ԣ���ʱ�ͷŷ�����α��������Դ��
*/
----������
--�����α�
DECLARE cursor_name CURSOR
[FORWORD_ONLY|SCROLL]
FOR select_statements
[FOR {READ ONLY|UPDATE}] 
--���α�
OPEN cursor_name
--��ȡ�α�λ������
FETCH [NEXT|PRIOR|FIRST|LAST]
FROM cursor 
--�ر��α�
CLOSE cursor_name
--ɾ���α�
DEALLOCATE cursor_name
-------------------------------
--1�����������α�
--������1������һ����ΪCrsCourse���α꣬���α��Course���в�ѯ���������в�������ʾ�����γ̱��Ϊ��002���������е���ѡ�����޸�Ϊ22��
--��1��ʹ��DECLARE CURSOR��������α꣬
USE Xk
GO
DECLARE CrsCourse CURSOR 
FOR 
	SELECT * FROM Course --ORDER BY CouNo
--��2��ʹ��OPEN�����αꡣ
OPEN CrsCourse
--��3��ʹ��FETCH��䣬���α��в�ѯ�����������С�
FETCH NEXT FROM CrsCourse   --001�Ŀγ�
FETCH NEXT FROM CrsCourse   --002�Ŀγ�
--��4������ǰ�����е���ѡ�����޸�Ϊ22
UPDATE Course SET LimitNum=22 WHERE CURRENT OF CrsCourse
--DELETE Course WHERE CURRENT OF CrsCourse   --ɾ����ǰ������002�Ŀγ̣��˴��ݲ�ִ�д���䣬���ִ�У����ʻ����ʲô���⣿
--��5��ʹ��CLOSE���ر��α�
CLOSE CrsCourse
--��6��ʹ��DEALLOCATE����ͷ��α�
DEALLOCATE CrsCourse
GO

--2������ʹ�ñ������α�
--������2������ҵ���ʱ��Ҫ��FETCH�Ľ������ڱ����
USE Xk
GO
--�������
DECLARE @CouNo nvarchar(3),@CouName nvarchar(30)
DECLARE CrsCourse2 CURSOR 
FOR 
	SELECT CouNo,CouName FROM Course ORDER BY CouNo
OPEN CrsCourse2
--ʹ��FETCH��ֵ�������,ע���������˳���������͡���Ŀ���α���һ�¡�
FETCH NEXT FROM CrsCourse2 INTO @CouNo,@CouName
--���ñ�����ӡ���
Select @CouName '�γ�����',@CouNo '�γ̺�'
--PRINT '�γ̺�:'+@CouNo+'�γ����ƣ�'+@CouName

CLOSE CrsCourse2
DEALLOCATE CrsCourse2
GO

--3������ʹ��@@FETCH_STATUS���α����������
/*
FETCH�ɹ������ֵΪint��
	0��FETCH���ɹ�
   ��1: FETCH���ʧ�ܻ���в��ڽ������
   ��2������ȡ���в�����
*/
--����������һ����ΪCrsCourse���α꣬���α��Course���в�ѯ���������С�
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


--��������˼��2����ѯ��Ϣ������γ̵���Ϣ�����γ̺�����Ҫ������������ʾ��
--����1������һ���α�


--����2�����α�

--����3����ȡ�α�λ������
--ȡ�õ�һ������

--ͨ���ж�@@FETCH_STATUS����ѭ��ȡ��

--����4���ر��α�

--����5���ͷ��α�



--������3����д����ʹ���α�������ʾ��ѯ���������������ÿһ�У�ʹ��@@FETCH_STATUS��Ϊѭ�����Ʊ�����
--�����α�
DECLARE @CouNo nvarchar(3),@CouName nvarchar(20)
DECLARE CrsCourse CURSOR 
FOR 
SELECT CouNo,CouName FROM Course ORDER BY CouNo
--���α�
OPEN CrsCourse 
--ȡ�õ�һ������
FETCH NEXT FROM CrsCourse INTO @CouNo,@CouName 
--ͨ���ж�@@FETCH_STATUS����ѭ��
WHILE @@FETCH_STATUS=0 
BEGIN
  Select @CouNo '�γ̺�',@CouName '�γ�����'
  --PRINT '�γ̺�:' + @CouNo+'�γ����ƣ�' + @CouName
  --ȡ����һ������
  FETCH NEXT FROM CrsCourse INTO @CouNo,@CouName 
END
--�ر��α�
CLOSE CrsCourse
--�ͷ��α�
DEALLOCATE CrsCourse
GO
--С�᣺�α���������Ҫ��������������Ĵ�����̡�������Խ�����е�ÿһ��ִ�в�ͬ�Ĳ��������������������ִ��ͬһ�����������

--����1��ʹ���α����Course����������������Ŀγ̵���Ϣ���γ̱�š��γ����ơ�����������





--����2��ʹ���α����Course������ܱ����������Ŀγ������Ϣ���γ���𡢸���γ̵��ܱ���������




--4���������α�Ĵ洢����
--��ʵ��Ӧ���У�ͨ����ϴ洢����ʹ���α꣬�α��ر��ʺ�������������Ĵ�����̡�
--����ܺ���ؽ��ͻ���ѭ�������Ĵ���ת��Ϊ�洢���̲�ʹ���α������������������ݵĴ����ٶȡ�
--˼������д������3������Ϊ�����α�Ĵ洢���̡�
CREATE PROCEDURE P_PrintCouName
AS
	DECLARE @CouNo nvarchar(3),@CouName nvarchar(20)
	DECLARE CrsCourse CURSOR 
	FOR 
		SELECT CouNo,CouName FROM Course ORDER BY CouNo
	--���α�
	OPEN CrsCourse 
	--ȡ�õ�һ������
	FETCH NEXT FROM CrsCourse INTO @CouNo,@CouName 
	--ͨ���ж�@@FETCH_STATUS����ѭ��
	WHILE @@FETCH_STATUS=0 
	BEGIN
		PRINT '�γ̺�:' + @CouNo+'�γ����ƣ�' + @CouName
		--ȡ����һ������
		 FETCH NEXT FROM CrsCourse INTO @CouNo,@CouName 
	END
	--�ر��α�
	CLOSE CrsCourse
	--�ͷ��α�
	DEALLOCATE CrsCourse
GO
EXEC P_PrintCouName
GO

----����3�������������ַ�ʽ�������˼��4����ϰ��
/*˼��3����ѯ����ͬѧ��ѧ�ź�����������������������Ҫ����ʾΪ��
ѧ��     ����
02000011  �ŷɽ�
02000046  �ŷ�
������������
*/




/*˼��4��������ʾ����ͬѧ��ѧ�ź�������Ҫ����ʾ���¸�ʽ��
ѧ��      ����
02000011  �ŷɽ�
ѧ��      ����
02000046  �ŷ�
*/
--����һ�����������α�ķ�ʽ




--��������ʹ��FETCH��ֵ�������





--���������������α�Ĵ洢����






----˼���������α��ʹ�ã�Ҫ����ʾ����ͬѧ��ѧ�ź�����������Ҫ����ʾĳ����Ϣ��
Use Xk
go
--�������
Declare @StuNo char(8),@StuName char(8)
--����1�������α�
DECLARE Student_Cursor Scroll Cursor 
FOR
  SELECT StuNo,StuName from Student
  WHERE StuName like '��%'
  ORDER BY StuNo
--����2�����α�
OPEN Student_Cursor
--����3����ȡ����
FETCH LAST From Student_Cursor          /*���һ��*/
FETCH PRIOR From Student_Cursor         /*ǰ��һ��*/
FETCH FIRST FROM Student_Cursor        /*��һ��*/
FETCH ABSOLUTE 2 From Student_Cursor    /*����λ�õ�2��*/
FETCH RELATIVE 3 From Student_Cursor     /*��Ե�ǰ�е����λ������3��*/
FETCH RELATIVE -2 From Student_Cursor     /*��Ե�ǰ�е�����2��*/
--����4���ر��α�
CLOSE Student_Cursor
--����5���ͷ��α�
Deallocate Student_Cursor
GO

--5���α���ۺ�Ӧ�ã�ѡѧ��
--������4����ѡ��ϵͳXK�У����ڶ�ÿ�ſε��Ͽ��������������ƣ����Ա�������û�н������ƣ�������Course���л���ֱ�����������ѡ�������������
--��ʱ��Ҫϵͳ��ȡ����������ȡ�ķ�ʽ����ѡ�ν����
USE XK
GO
CREATE PROCEDURE ChooesCourse
--�����ڼ�־Ը
@WillOrder INT 
AS
DECLARE @StuNo nvarchar(3),@CouNo nvarchar(3),@LimitNum INT,@ChooseNum INT,@WillNum INT,@I INT
--�����α����ÿһ�ſγ̳�ȡѧ������
DECLARE cCourse CURSOR FOR 
  SELECT CouNo,LimitNum,WillNum,ChooseNum FROM Course ORDER BY CouNo
--���α�
OPEN cCourse
--ѭ����ȡ�α꣨ѭ��Course��
FETCH NEXT FROM cCourse INTO @CouNo,@LimitNum,@WillNum,@ChooseNum
WHILE @@FETCH_STATUS=0
BEGIN
  --���㹻������ѡ������ѧ���������ѧ����û�б����ɹ��Ļ���
  IF @LimitNum-@ChooseNum>=@WillNum  
    UPDATE StuCou SET State='ѡ��' 
    WHERE WillOrder=@WillOrder AND CouNo=@CouNo AND StuNo NOT IN (SELECT StuNo FROM StuCou WHERE  State='ѡ��')
  ELSE 
  --û���㹻������ȡ����ʣ������
  BEGIN
    --��ѡѧ������
    DECLARE cStuCou CURSOR FOR 
      SELECT StuNo FROM StuCou 
      WHERE WillOrder=@WillOrder AND CouNo=@CouNo AND StuNo NOT IN (SELECT StuNo FROM StuCou WHERE  State='ѡ��') 
      ORDER BY RandomNum
    OPEN cStuCou
    FETCH NEXT FROM cStuCou INTO @StuNo
    --����ѭ������@I����С��ʣ������ʱ��@I<=@LimitNum-@ChooseNum����������
    SET @I=1
    WHILE @@FETCH_STATUS = 0 AND @I<=@LimitNum-@ChooseNum
    BEGIN 
      UPDATE StuCou SET State='ѡ��' WHERE CURRENT OF cStuCou
      SET @I=@I+1
      FETCH NEXT FROM cStuCou INTO @CouNo
    END
    CLOSE cStuCou
    DEALLOCATE cStuCou
  END
  FETCH NEXT FROM cCourse INTO @CouNo,@LimitNum,@WillNum,@ChooseNum
END
--ͳ��ѡ������
UPDATE Course SET ChooseNum=(SELECT COUNT(*) FROM StuCou WHERE CouNo=Course.CouNo AND State='ѡ��') 
CLOSE cCourse
DEALLOCATE cCourse
GO
--��4������ִ��
USE Xk
GO
--���ô��������Ч��
ALTER TABLE StuCou DISABLE TRIGGER UpdateWillNum
GO
--��ѡ�α�Ĵ������������ϵ�ǰ־Ը�ţ������ֵ
UPDATE StuCou SET RandomNum=NEWID()
--���һ־Ը
EXEC ChooesCourse 1
GO
--��ڶ�־Ը
EXEC ChooesCourse 2
GO
--�����־Ը
EXEC ChooesCourse 3
GO
--�����־Ը
EXEC ChooesCourse 4
GO
--�����־Ը
EXEC ChooesCourse 5
GO
--�ָ����õĴ�����
ALTER TABLE StuCou ENABLE TRIGGER UpdateWillNum
GO

SELECT * FROM Course
go


--������5����ѯ�κ�־Ը��û�б�ѡ�е�ѧ������������Ϊ�������ȡ������ִ�н���᲻һ������
SELECT * FROM Student WHERE StuNo NOT IN
(
	SELECT DISTINCT StuNo FROM StuCou WHERE State='ѡ��'
)
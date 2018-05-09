--һ������Sale���ݿ�(����Test12_SaleDB.sql)�����������Ŀ��
--�����洢����p_SelProduct��������ʾ��Ʒ������Ϣ�����ݰ�����Ʒ��š���Ʒ���ơ��������ڡ��������������۽�Ҫ����ʾ��ʽ���£�
--��Ʒ��� ��Ʒ����   ��������    ��������  ���۽��
-- 00001    ����       2002-1-1    10        30000
--��Ʒ��� ��Ʒ����   ��������    ��������  ���۽��
-- 00002    �յ�       2006-1-2     5        10000
use sale
go

alter PROCEDURE p_SelProduct
AS
	DECLARE @prono varchar(5),@proname varchar(20),@saledate date,@quantity decimal(6,0),@sumprice decimal(8,2)
	DECLARE CrsCourse CURSOR 
	FOR 
		SELECT product.prono,proname,saledate,sum(quantity),sum(quantity)*price'���۽��'
		from product ,proout
		WHERE product.prono=proout.prono
		group by product.prono,proname,saledate,price

	--���α�
	OPEN CrsCourse 
	--ȡ�õ�һ������
	FETCH NEXT FROM CrsCourse INTO @prono,@proname, @saledate,@quantity,@sumprice
	--ͨ���ж�@@FETCH_STATUS����ѭ��
	WHILE @@FETCH_STATUS=0 
	BEGIN
		PRINT '��Ʒ��� ��Ʒ����   ��������    ��������  ���۽��'
		print @prono+@proname+cast(@saledate as varchar(30))+cast(@quantity as varchar(30))+cast(@sumprice as varchar(30))
		--ȡ����һ������
		 FETCH NEXT FROM CrsCourse INTO @prono,@proname, @saledate,@quantity,@sumprice
	END
	--�ر��α�
	CLOSE CrsCourse
	--�ͷ��α�
	DEALLOCATE CrsCourse
GO


EXEC p_SelProduct
GO


--����
--��������XK���ݿ⣬����������
--1��ʹ���α갴�в�ѯ����������ͬѧ�ļ�¼��
use Xk
go

alter PROCEDURE P_Print_wang
AS
	DECLARE CrsCourse CURSOR 
	FOR 
		SELECT StuNo,StuName from Student
		  WHERE StuName like '��%'
		  ORDER BY StuNo
	--���α�
	OPEN CrsCourse 
	--ȡ�õ�һ������
	--ͨ���ж�@@FETCH_STATUS����ѭ��
	FETCH NEXT FROM CrsCourse 
	WHILE @@FETCH_STATUS=0 
	BEGIN
		
		--ȡ����һ������
		 FETCH NEXT FROM CrsCourse 
	END
	--�ر��α�
	CLOSE CrsCourse
	--�ͷ��α�
	DEALLOCATE CrsCourse
GO


EXEC P_Print_wang
GO





--2����ѧ��Ϊ��01000008��ͬѧ��ѡ�������޸�Ϊ��88888888�������α���ɡ�

DECLARE @stuno nvarchar(8)
DECLARE CrsCourse CURSOR 
	FOR 
		SELECT StuNo from student where stuno='01000008'
	--���α�
	OPEN CrsCourse 
	--ȡ�õ�һ������
	--ͨ���ж�@@FETCH_STATUS����ѭ��
	FETCH NEXT FROM CrsCourse into @stuno
	WHILE @@FETCH_STATUS=0 
	BEGIN
		if(@stuno='01000008')
			UPDATE student SET Pwd='88888888' WHERE CURRENT OF CrsCourse
		--ȡ����һ������
		FETCH NEXT FROM CrsCourse into @stuno
	END
	--�ر��α�
	CLOSE CrsCourse
	--�ͷ��α�
	DEALLOCATE CrsCourse



--3���޸����ϳ����ܸ����û������ѧ�ţ��޸ĸ�ѧ��ͬѧ��ѡ������Ϊ�û�����������롣��Ҫ��ʹ�ô��α�Ĵ洢������ɡ���
go

create PROCEDURE xiugaimima( @stuno nvarchar(8) ,@mima nvarchar(8) )
AS
	DECLARE @stuno1 nvarchar(8)
	DECLARE CrsCourse CURSOR 
		FOR 
			SELECT StuNo from student 
		--���α�
		OPEN CrsCourse 
		--ȡ�õ�һ������
		--ͨ���ж�@@FETCH_STATUS����ѭ��
		FETCH NEXT FROM CrsCourse into @stuno1
		WHILE @@FETCH_STATUS=0 
		BEGIN
			if(@stuno1=@stuno)
				UPDATE student SET Pwd=@mima WHERE CURRENT OF CrsCourse
			--ȡ����һ������
			FETCH NEXT FROM CrsCourse into @stuno
		END
		--�ر��α�
		CLOSE CrsCourse
		--�ͷ��α�
		DEALLOCATE CrsCourse
GO
drop PROCEDURE xiugaimima
go


EXEC xiugaimima '00000001','aaaaaaa'
GO

SELECT StuNo ,pwd ,stuname from student
go



--4�����ݸ�����ͬѧ�����֣�������ʾ��ͬѧ��ѡ����Ϣ�����ݰ����γ̱�š��γ����ơ�ѧ�š������������ѯ��������ͬѧ��ѡ����Ϣ��
create PROCEDURE chauxn( @stuname nvarchar(10) )
AS
	DECLARE CrsCourse CURSOR 
		FOR 
			SELECT course.couno,couname,student.stuno,stuname  from course ,student ,stucou where student.stuno=stucou.stuno and course.couno=stucou.couno and stuname=@stuname
		--���α�
		OPEN CrsCourse 
		--ȡ�õ�һ������
		--ͨ���ж�@@FETCH_STATUS����ѭ��
		FETCH NEXT FROM CrsCourse 
		WHILE @@FETCH_STATUS=0 
		BEGIN
			--ȡ����һ������
			FETCH NEXT FROM CrsCourse 
		END
		--�ر��α�
		CLOSE CrsCourse
		--�ͷ��α�
		DEALLOCATE CrsCourse
GO

EXEC chauxn '�ֱ�'
GO





--5������һ����ΪCrsStudent���α꣬����һ����ΪCrsStudent���α꣬ʹ����ʾ��00�������񡱰������ѧ��ѧ�ź�������Ϣ����������ʾǰ����ѧ����Ϣ.




--6������һ���洢���̣������α���course����ĳϵ���û�����ϵ���룩�����γ̵���������������ѿγ����ƺ������������Ϊ����������ظ��û��� 


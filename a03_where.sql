select * from emp;
-- 
/*
or������ : ��ȸ ���ǿ� �־, �ϳ��� ���Ǹ� �����ϴ���, �ش� �����Ͱ� ��� ó���Ǵ°�
select �÷�
from ���̺��
where �÷�1 = ����1 or �÷�2 = ����2
�÷�1=����1�� �����ϰų�, �÷�2=����2�� �ϳ����̶� �����Ҷ�
�����͸� list�Ѵ�
ex) �μ���ȣ�� 30�̰ų� ����� 'SMITH'�� ������ list
*/
select * from emp where deptno=30 or ename='SMITH';
-- Ȯ�ο���) ���ʽ��� �ְų� ��å�� 'SALESMAN'�� ������ list
select * from emp where comm is not null or job='SALESMAN';
/*
not ������
�ش� �������� ���̸� ����, �����̸� ������ ó���Ǿ� ��Ÿ�� �ʿ䰡 ������ ���
�Ϲ������� ���� �̿ܿ� �����͸� ����Ʈ�� ��

�μ���ȣ�� 10�� �ƴ� �����͸� list
*/
select * from emp
where not deptno=10; -- deptno <>10, deptno !=10 (������ ȿ��)
-- Ȯ�ο���) ������ 2000~3000�� �ƴ� ���� keyword�� Ȱ���ؼ� list
select * from emp
where not (sal>=2000 and sal<=3000);
-- Ȯ�ο���) ��å�� SALESMAN�� �ƴϰ�, ������ 2000�̻��� ����� list
select * from emp
where not job='SALESMAN' and sal >= 2000;
/*
between and ������
�������� ������ Ư�� ���� ���̿� ���� ��, Ȱ��Ǵ� Ű����
where �÷��� between A and B
�ش� �������� �÷��� ������ A�� B���̿� �ִ� ���� ���Ѵ�
������ 2000���� 3000���̿� �ִ� �����͸� list
*/
select * from emp
where sal between 2000 and 3000;
-- Ȯ�ο���) ����� 7400~7500 ���̿� ������, ������ 2000�̸��̰ų� 3000�ʰ��ϴ� ������list
select * from emp
where empno between 7400 and 7500 and not (sal between 2000 and 3000);
/*
��¥�� ���� ó��
�Ի����� 1981/01/01 ���� 1981/12/31 ���̿� �ִ� �����͸� list
*/
select * from emp
where emp.HIREDATE BETWEEN '1981/01/01' and '1981/12/31';
-- �Ի����� 1981�� 12���� �Ի��� ����� �̸��� �μ���ȣ�� list
select ename, deptno from emp where hiredate between '1981/12/01' and '1981/12/31';
-- sysdate : ���� ��¥�� ����ϴ� ����
select ename, hiredate, sysdate
from emp;
/*
in ������
�ش� �����Ϳ� ���� ������ ó���� ��, ���� �����Ϳ� ���� ��ȸ�� �ϰ��� �� �� Ȱ��
or�����ڿ� ������ ����
����) �÷��� in(�ش絥����1,�ش絥����2,�ش絥����3)
*/
select * from emp;
-- ������ ��ȣ�� 7902, 7566, 7839�ΰ��� list
select * from emp
where mgr in (7902,7566,7839);
-- Ȯ�ο���) ����̸��� 'SMITH', 'WARD', 'JONES' �� ��� ��, ������ 1000�̸��� �����͸� �̸��� ����list
select ename, sal from emp
where ename in('SMITH', 'WARD', 'JONES') and sal<=1000;
/*
like�����ڿ� ���ϵ�ī��(%,_)Ȱ���ϱ�
Ư�������Ϳ� ���� ���ڿ� ��ü ������ ��Ȯ�ϰ� ���� ���� ��, �˻������� ���� like�����ڿ� ���ϵ�ī�带 Ȱ��
����) �˻��÷��� like '%�˻��ҵ�����%';

ex) ����� K�� ���Ե� �����͸� list 
*/
select * from emp
where ename like '%K%';
-- ���� K�� �����ϴ� �����͸� list�Ϸ���?
select * from emp
where ename like 'K%';
select * from emp;
-- ��å��, MAN���� ������ �����͸� list
select * from emp
where job like '%MAN';
-- Ȯ�ο���) ��å�� S�� �����ϴ� �����Ϳ��� ���ʽ��� 300�̰ų� 400,700�� �����͸� ��å,�����, ���ʽ��� list
select job, ename, comm from emp
where job like 'S%' and comm in(300, 400, 700);
select * from emp;
/*
���ϵ� ī��(_) ����ϱ�
_���ڼ��� �����ؼ� �ش系���� �˻��ϰ��� �� ��, Ȱ��
ex) �ι�° ���ڰ� 'A'�� ����� list
*/
select * from emp
where ename like '_A%'; -- �ι�° ���ڰ� A�� �� ���� ��ü ���
-- Ȯ�ο���) ������� 3��° ��¥�� A�� �������� �޿��� 2000�̻��� ������ list
select * from emp
where ename like '__A%' and sal >= 2000;
/*
not like '���ϵ�ī��(%,_)'�ش� ������ �ƴ� ���� ���
*/
select * from emp
where ename not like '%A%';
-- Ȯ�ο���) ��å�� ER�� ������ �ʴ� ������ ��, 1981�⵵�� �Ի��� ����� list
select * from emp
where job not like '%ER' and hiredate between '1981/01/01' and '1981/12/31';
/*
����ó��
�����ʹ� ������ ���������� ��������, ������������ ������ �� �ִ�
�̿� ���� ���صǴ� �÷��� ���ؾ� �ϸ�, ������������ �������������� ǥ��
����) order by �����÷�1 asc/desc
asc : ���������� ���ϸ� �Ϲ������� �������� ������ default��
desc : ���������� ���Ѵ�
ex) �޿��������� ������������ ��� 
*/
select * from emp
order by sal asc;
select * from emp
order by sal desc;
-- ex) ��å�� MANAGER�� �����͸� �Ի��� �������� �������� list
select * from emp
where job = 'MANAGER'
order by hiredate;
-- Ȯ�ο���) ���ʽ��� �ִ� �����͸� �������� ������������ �����, �޿�, ���ʽ��� list
select ename, sal, comm from emp
where comm is not null
order by comm desc;
-- ���ı����� ���� ���� 3������ �Ǿ� �ִٸ� ��� �ұ�?
select ename, sal, comm from emp
order by comm desc;
-- comm�� ������ ���� sal�������� �������� ó��
select ename, sal, comm from emp
order by comm desc, sal desc;
/*
Ȯ�ο���
1) �Ի����� ������������ �����ϵ� �����ȣ, �����, ����, �Ի����� ���
2) �����ȣ�� �������� ������������ �����Ͽ� �����ȣ�� ����� ���
3) �μ� ��ȣ�� ���� ������� ����ϵ� ���� �μ��� ����� �ֱ� �Ի��� ������� ���
	�����ȣ, �Ի���, �����, �޿�������
*/
select empno, ename, job, hiredate from emp
order by hiredate;
select empno, ename from emp
order by empno desc;
select empno, hiredate, ename, sal from emp
order by deptno asc, hiredate desc;

select * from dual;
/*
dual : �����͸� �׽�Ʈ�ϱ� ���� �뵵�� oracle ���� ��ü, �� ������ ��µȴ�
�ַ� ����, �Լ����볻�� Ȯ��
*/
select 10+10 plus, sysdate, 10||'+'||10||'='||(10+10) calcu from dual;

select * from emp;



  create database company;
  use company;
  /*
  关系 DEPARTMENT (DNAME, DNO, MGRSSN, MGRSTARTDATE)
  DNAME: 部门名，
  DNO: 部门号，
  MGRSSN: 部门领导身份证号
  MGRSTARTDATE: 部门领导开始领导工作的日期
  */
  create table department(
    dName VARCHAR(50),
    DNO VARCHAR(50), 
    managerSSN VARCHAR(50), 
    managerStartDate VARCHAR(50),
    primary key(DNO)
    );
  /* 
  关系 EMPLOYEE (ENAME, ESSN, ADDRESS, SALARY, SUPERSSN, DNO) 
  ENAME: 工作人员名字，
  ESSN: 工作人员身份证号，
  ADDRESS: 工作人员住址，
  SALARY: 工作人员工资，
  SUPERSSN: 工作人员直接领导的身份证号
  DNO: 所属部门号
  */
  create table employee(
    eName VARCHAR(50),
    eSSN VARCHAR(50), 
    address VARCHAR(100), 
    salary VARCHAR(50), 
    superSSN VARCHAR(50) , 
    DNO VARCHAR(50), 
    primary key(eSSN),
    foreign key(DNO) references department(DNO)
  );

  /*
  关系 PROJECT (PNAME, PNO, PLOCATION, DNO) 
  PNAME: 工程项目名，
  PNO: 工程项目号，
  PLOCATION: 工程项目所在地，
  DNO: 工程项目所属部门号
  */
  create table project(
    pName VARCHAR(50),
    PNO VARCHAR(50),
    pLocation VARCHAR(50),
    DNO VARCHAR(50),
    primary key(PNO),
    foreign key(DNO) references department(DNO)
  );
  /*
  关系 WORKS_ON (ESSN, PNO, HOURS) 
  ESSN: 工作人员身份证号，
  PNO: 工程项目号，
  HOURS: 工作小时数 
  */
  create table works_on(
    eSSN VARCHAR(50),
    PNO VARCHAR(50),
    HOURS VARCHAR(50),
    primary key(eSSN,PNO),
	foreign key (essn) references employee(essn),
	foreign key (pno) references project(pno)
  );

  -- 从文件中加载数据到 department
  load data local infile "/Volumes/Mac_expend/codeForLearning/hit-database/lab/lab1/resources/departments.txt" into table department;

  -- 从文件中加载数据到 employee
  load data local infile "/Volumes/Mac_expend/codeForLearning/hit-database/lab/lab1/resources/employees.txt" into table employee;

  -- 从文件中加载数据到 project
  load data local infile "/Volumes/Mac_expend/codeForLearning/hit-database/lab/lab1/resources/projects.txt" into table project;

  -- 从文件中加载数据到 works_on
  load data local infile "/Volumes/Mac_expend/codeForLearning/hit-database/lab/lab1/resources/work_on.txt" into table works_on;

------------------------------ 数据查询问题分割线 ------------------------------

-- 创建关系数据库 COMPANY后，使用 SQL 语言完成如下查询: 

-- 1:参加了项目名为“SQL Project”的员工名字;

select eName from employee, works_on, project where employee.eSSN=works_on.eSSN and works_on.PNO=project.PNO and project.pName="SQL Project";
-- 2:在“Research Department”工作且工资低于 3000 元的员工名字和地址; 
select eName, address from employee, department where employee.salary<3000 and employee.DNO=department.DNO and department.dName="Research Department";

-- 3:没有参加项目编号为 P1 的项目的员工姓名; 

-- query result : 89 rows in set
select eName from employee; 
-- query result : 19 rows in set
select eName from employee natural join works_on where works_on.PNO="P1";
-- query result : 70 rows in set
select eName from employee where not exists (select * from works_on where works_on.PNO="P1"  and employee.eSSN=works_on.eSSN); 

-- 4:由张红领导的工作人员的姓名和所在部门的名字; 
-- 先找出张红领导的部门号 , 然后使用部门号找出部门的员工
select eName, dName from employee natural join department where department.DNO in (select department.DNO from department,employee where department.managerSSN=employee.eSSN and employee.eName = "张红");

-- 5:至少参加了项目编号为 P1 和 P2 的项目的员工号; 
-- 先找出参加了 P1 的员工号 , 再在里面找出参加了 P2 的员工号
select eSSN from  works_on where PNO="P2" and eSSN in (select eSSN from  works_on where PNO="P1");

-- 6:参加了全部项目的员工号码和姓名;
select ename , eSSN from employee where not exists 
  (select * from project where not exists 
    (select * from works_on where 
    project.pno=works_on.pno and works_on.essn=employee.essn)); 

select distinct ESSN, ENAME from EMPLOYEE natural join WORKS_ON 
group by ESSN having count(distinct PNO) = (select count(distinct PNO) from PROJECT);

-- 7:员工平均工资低于 3000 元的部门名称;
select dName from employee group by employee.DNO having avg(employee.salary)<3000; 

-- 8:至少参与了 3 个项目且工作总时间不超过 8 小时的员工名字; 

select * from works_on natural join employee ;

select ename, count(pno),sum(HOURS) from works_on natural join employee group by ename having count(PNO)>2 and sum(hours)<=8;

select ename from  employee where essn in 
  (select eSSN from works_on where eSSN in 
    (select essn from works_on group by eSSN having sum(HOURS)<=8)
  group by eSSN having count(PNO)>=3);

-- 9:每个部门的员工小时平均工资;
select * from works_on natural join department natural join employee ;
select sum(hours) from works_on group by dno;

select DNO , sum(salary), sum(hours),sum(salary)/sum(hours) from works_on natural join department natural join employee group by dno;


  SELECT DNAME, AVG(SALARY / R.sum) HOURS_SALARY, r.sum ,salary
  FROM EMPLOYEE, (
      SELECT ESSN, SUM(HOURS) sum
      FROM WORKS_ON
      GROUP BY WORKS_ON.ESSN) AS R, DEPARTMENT
  WHERE R.ESSN = EMPLOYEE.ESSN AND EMPLOYEE.DNO = DEPARTMENT.DNO
  GROUP BY DEPARTMENT.DNO;
# 数据库系统学习笔记

TODO : github 不支持 [toc] 目录 , 有时间去网上找一个自动生成的工具

## 专用名词介绍

- Database (DB) : 数据库
- Database Management System (DBMS) : 数据库管理系统

- DataBase Application (DBAP) : 数据库应用

- DataBase Administrator (DBA) : 数据库管理员

- 数据库管理语言

  以下三个统称为 SQL语言(结构化的数据库语言)

  - Data Definition Language (DDL) : 数据定义语言

  - Data Manipulation Language (DML) : 数据操作语言

  - Data Control Language (DCL) : 数据控制语言

    ![image-20210202210447117](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210202210447117.png)

## 什么是数据库管理系统

  ![image-20210203135756207](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210203135756207.png)

![image-20210203150628607](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210203150628607.png)

## 关系 (不同的数据组合后形成的东西 )

### 关系模型

### 什么是关系

- 域(domain) : 列的取值范围, 每一列有一个值域 ,值域的值的数据类型相同
- 笛卡尔积 : 由 n 个域形成的所有可能的 n 元祖集合

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208131638150.png" alt="image-20210208131638150" style="zoom:50%;" />

- 关系

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208131724675.png" alt="image-20210208131724675" style="zoom:50%;" />

- 关系模式

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208132022530.png" alt="image-20210208132022530" style="zoom:50%;" />

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208132744771.png" alt="image-20210208132744771" style="zoom:50%;" />

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208132826622.png" alt="image-20210208132826622" style="zoom:50%;" />

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210203153813929.png" alt="image-20210203153813929" style="zoom:50%;" />

### 关系特性

- 属性不可再分特性 : 关系第一范式

### 关系上的重要概念

- 候选码 candidate key

- 主码 primary key

- 主属性与非主属性

  ![image-20210208133440155](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208133440155.png)

- 外码 foreign key

### 总结

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208130951561.png" alt="image-20210208130951561" style="zoom:50%;" />

## 关系演算 (取出你想要的元组和属性)

以下内容见 <<数据库系统概论>> 第六章 形式化关系查询语言

### 关系代数

#### 自然连接

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209161258429-1612858378588.png" alt="image-20210209161258429" style="zoom:50%;" />

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209161643959-1612858604093.png" alt="image-20210209161643959" style="zoom:50%;" />

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210205143833168.png" alt="image-20210205143833168" style="zoom:50%;" />

### 关系元祖演算

### 关系域演算

### 表达式的安全性

 

## SQL语言 (用于操作数据库)

### 课堂讲义使用的数据库

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208182104350.png" alt="image-20210208182104350" style="zoom:50%;" />



### 建立数据库

- create database 数据库名;

- create table 表名(列名 数据类型, 列名 数据类型, 列名 数据类型, ... )

  ![image-20210208133850480](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208133850480.png)

### 基本查询

- `select 属性 from 表名 where 条件`

  - 从 表名 中选择 使 where 条件为真的元祖, 然后投影 select 属性

- 检索结果之去除重复记录 : distinct

  - `select distinct 属性 from 表名 where 条件`

- 检索结果之排序 : order by  列名 [asc | desc]

  - `selcect 列名, 列名 from 表名 where 条件 order by 列名 asc;`

    ![image-20210208134144642](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208134144642.png)

- 模糊查询

  - 列名 [not] like "字符串"

    ![image-20210208134251500](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208134251500.png)

    ![image-20210208134315438](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208134315438.png)



### 多表联合查询

- `select 属性 from 表名1, 表名2, 表名3 where 条件`

  - 从 表名 1, 表名 2, 表名 3 的笛卡尔积中选择使 where 条件为真的元祖, 然后 select 属性

- 等值连接

  <img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208134559794.png" alt="image-20210208134559794" style="zoom:50%;" />

- 重名处理

  <img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208134618452.png" alt="image-20210208134618452" style="zoom:50%;" />

- 不等值连接

  <img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208134710081.png" alt="image-20210208134710081" style="zoom:50%;" />

### 利用 SQL 语言进行 增 删 改

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208134828271.png" alt="image-20210208134828271" style="zoom:50%;" />

- INSERT 与 select 结合使用

  <img src="image-20210208135013506.png" alt="image-20210208135013506" style="zoom:50%;" />

- DELETE与 UPDATE

  - delete 删除表中的元祖

    <img src="image-20210208135124784.png" alt="image-20210208135124784" style="zoom:50%;" />

  - update 更新数据

    <img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208135200156.png" alt="image-20210208135200156" style="zoom:50%;" />

- 数据库定义操作

  - 修改
    - alter table 表名
  - 撤销
    - drop table 表名 (删除掉整张表)
    - drop database 数据库名 (撤销数据库)
  - 指定数据库
    - use 数据库名;
  - 关闭当前数据库
    - close 数据库名;

![image-20210208090256699](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208090256699.png)

### 复杂查询

- IN 子查询

  ![image-20210208100600915](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208100600915.png)

- θ some / θ all 子查询 ( 相当于全称量词 exist / all)

  ![image-20210208102804836](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208102804836.png)

  ![image-20210208110212564](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208110212564.png)

  ![image-20210208110143640](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208110143640.png)   

- [not ]exists 子查询

  ![image-20210208111356508](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210208111356508.png)

### 结果计算与聚合计算

- 结果计算
  - select 后面可以是计算表达式

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209102418672.png" alt="image-20210209102418672" style="zoom:50%;" />

- 聚合计算

  - SQL 作用在列值集合的内置聚合函数 agfunc 

    - count, sum, avg, max, min

    ```sql
    -- 求计算机系教师的工资总额(此时 sum 作用于结果元祖的 salary 列值集合)
    select sum(salary) from Teacher T, Dept where Dept.Dname='计算机' and Dept.D#=T.D#;
    ```

<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209102646610.png" alt="image-20210209102646610" style="zoom:50%;" />

### 分组查询与分组过滤

- 分组查询

  - ```sql
    select 列名 from 表名 where 检索条件 group by 分组条件
    ```

  - 分组条件可以是 : 列名 1, 列名 2 ... (列名相同的为一个组)

    <img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209110055288.png" alt="image-20210209110055288" style="zoom:50%;" />

- 分组过滤

  - 聚合函数**不可以放在 where 检索条件**中, 因为作用对象不一样

  - where 是对一个元祖进行判断, 聚合函数作用于列值集合

  - 因此有了 having, 可以把聚合函数放在这里

  - having 必须和 group by 一起使用

  ```sql
  select 列名 from 表名 where 检索条件 group by 分组条件 having 分组过滤条件
  ```

  ![imagecannotshowwhatthef](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/imagecannotshowwhatthef.png)

  ![image-20210209112636168](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209112636168.png)

  此时聚合函数 avg 作用于每个 group 的列值集合

### SQL 语言实现关系代数操作

#### 并运算 union , 交运算 intersect , 差运算 except

![image-anothercannotshow](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-anothercannotshow.png)

```sql
-- 默认 union 去除重复
select 列名 from 表名 union select 列名 from 表名

-- union all 不去除重复
select 列名 from 表名 union all select 列名 from 表名

-- 学过 001 号课程或学过 002 号课程的学生(可以转换成不用union的形式)
select Sname from SC where C#=001
union
select Sname from SC where C#=002

-- 两个表的情况下就转换成不用 union 的形式
-- 表 customers(cid, cname, city, discent)
-- 表 agents(aid, aname, city, percent)
-- 求客户以及代理商所在城市
select city from customers
union
select city from agents

-- 既学过 001 号课程又学过 002 号课程的学生(可以转换成不用intersect 的形式)
select Sname from SC where C#=001
intersect
select Sname from SC where C#=002

-- 假设所有学生都有选课,求没学过 002 号课程的学生学号
select S# from SC 
intersect
select S# from SC where C#=002


```

#### 空值的处理

![image-20210209144737337](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209144737337-1612853257477.png)

![image-20210209145006167](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209145006167-1612853406315.png)

#### 内连接, 外连接

- inner join , left outer join , right join , full outer join 

  <img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209161753080-1612858673220.png" alt="image-20210209161753080" style="zoom:50%;" />

  <img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209162019029-1612858819170.png" alt="image-20210209162019029" style="zoom:50%;" />

  ​		<img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209162319554-1612858999693.png" alt="image-20210209162319554" style="zoom:50%;" />

  <img src="https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209162731306-1612859251445.png" alt="image-20210209162731306" style="zoom:50%;" />



### SQL 视图

![image-20210209163719105](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209163719105-1612859839255.png)

```sql
-- 定义一个视图为计算机系的学生
create View viewName as (select * from student where D# in (select D# from dept where Dname='计算机'));

```

![image-20210209164206113](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209164206113-1612860126259.png)

- 视图的更新

![image-20210209164820254](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209164820254-1612860500398.png)

![image-20210209164924984](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209164924984-1612860565132.png)

```sql
-- 撤销视图
drop View viewName
```

### SQL 语言基础使用总结

![image-20210209165415703](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210209165415703-1612860855855.png)

## 数据库的完整性 (不能让数据中出现不和谐的东西)

### 完整性问题

#### 定义

![image-20210213121251332](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213121251332-1613189571480.png)

#### 产生原因

![image-20210213115209695](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213115209695-1613188330059.png)

#### 解决方法

![image-20210213115412272](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213115412272-1613188452422.png) 

#### 约束条件的一般形式

对于集合 O , A 被触发的时候检查是否满足条件 P , 若不满足 , 执行动作 R

![image-20210213115842490](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213115842490-1613188722641.png)

#### 数据库完整性的分类

约束对象分类

![image-20210213120207735](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213120207735-1613188927887.png)

按约束来源分类

![image-20210213120517924](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213120517924-1613189118070.png)

#### 按约束状态分类

- 静态约束 : 任何时候都要满足的约束

- 动态约束 : DB 状态改变时满足的约束

### SQL语言实现完整性约束

#### 表完整性与列完整性

`create table tablename(约束条件:表约束,列约束);`

- col_constr 列约束 (只能应用在一列上)

![image-20210213122840369](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213122840369-1613190520515.png) 

- table_constr 表约束

![image-20210213123319619](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213123319619-1613190799817.png)

- check 条件可以是 where 条件内的的任何语句和子查询

![image-20210213124030283](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213124030283-1613191230438.png)

- 撤销或追加约束

![image-20210213124349556](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213124349556-1613191429708.png)

![image-20210213124438548](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213124438548-1613191478704.png)

#### 断言

过多的断言会降低数据库的速度

![image-20210213124702748](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213124702748-1613191622907.png)

![image-20210213125015944](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213125015944-1613191816105.png)

![image-20210213131917213](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213131917213-1613193557376.png)

#### 触发器 Trigger

一段程序 , 可以在特定时刻被触发执行

- 事件

  ![image-20210213133029204](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213133029204-1613194229363.png)

  ![image-20210213133045805](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213133045805-1613194245989.png)

- 示例

  ![image-20210213133516841](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213133516841-1613194516995.png)

  ![image-20210213133744574](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213133744574-1613194664746.png)

  ![image-20210213134053744](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213134053744-1613194853905.png)

  ![image-20210213134604966](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213134604966-1613195165134.png)

  ```sql
  create trigger del_sc after delete on Student
  	referencing old oldS
  	for each row
  		begin
  			delete sc where sc.s# = :oldS.s#;
  		end;
  ```

  ![image-20210213134945545](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213134945545-1613195385704.png)

  ```sql
  create trigger S#_null after delete on student
  	referencing old oldS#
  	for each row
  		begin
  			update sc set s#=null where sc.s# = :oldS#.s#;
  		end;
  ```

  ![image-20210213135359060](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213135359060-1613195639232.png)

#### 小结

![image-20210213135629346](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213135629346-1613195789510.png)

## 数据库安全性 (不能让人看到不该看的数据)

### 概念

![image-20210213135902118](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213135902118-1613195942282.png)

### 安全机制

![image-20210213140239098](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213140239098-1613196159271.png)

### 数据库自主安全性

授予用户账户一定的权限 , 让其访问应该访问的数据 , 不该访问的就不让其访问

![image-20210213140603740](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213140603740-1613196363911.png)

![image-20210213140739776](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213140739776-1613196459962.png)

### 两种自主安全性的实现方式

- 存储矩阵

  ![image-20210213142018801](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213142018801-1613197218962.png)

- 视图

  ![image-20210213142036992](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213142036992-1613197237166.png)

### 利用 SQL 实现数据库自主安全性

#### 用户与权利

select , modify , create

![image-20210213142359190](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213142359190-1613197439347.png)

#### 授权命令

![image-20210213142728472](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213142728472-1613197648653.png)

![image-20210213142901468](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213142901468-1613197741636.png)

#### 收回授权命令

![image-20210213142956986](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213142956986-1613197797147.png)

#### 授权过程

![image-20210213143109479](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213143109479-1613197869657.png)

### 强制安全性

![image-20210213143410301](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213143410301-1613198050488.png)

![image-20210213143905321](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213143905321-1613198345503.png)

![image-20210213143958765](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213143958765-1613198398952.png)

### 小结

![image-20210213144111302](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/image-20210213144111302-1613198471466.png)








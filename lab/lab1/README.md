## 实验一中遇到的问题
## 创建表的顺序的问题
因为有外键的存在 , 必须要先存在这个表, 然后在引用其属性作为外键, 所以 department 放在前面创建
## 读取磁盘文件数据到数据库的问题

mysql 报错 : Loading local data is disabled; this must be enabled on both the client and server sides


``` sql

mysql> select eName from employee, works_on, project where employee.eSSN=works_on.eSSN and works_on.PNO=project.PNO and project.pName="SQL Project";
+-----------+
| eName     |
+-----------+
| 柏蝶平    |
| 石程      |
| 裴纯晶    |
| 马豪      |
| 禄艳珠    |
| 池恒      |
| 孟祥霭    |
| 谈怡奇    |
| 闻莲谦    |
| 耿伊      |
| 路言良    |
| 瞿泰承    |
| 张红      |
| 邵顺      |
| 江瑞      |
| 葛邦泰    |
| 童洋顺    |
| 倪山      |
| 何强辉    |
+-----------+
19 rows in set (0.00 sec)
```
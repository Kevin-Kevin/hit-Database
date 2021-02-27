## 实验一中遇到的问题
## 创建表的顺序的问题
因为有外键的存在 , 必须要先存在这个表, 然后在引用其属性作为外键, 所以 department 放在前面创建
## 读取磁盘文件数据到数据库的问题

> mysql 报错 : Loading local data is disabled; this must be enabled on both the client and server sides

```sql
-- 登录 mysql 后键入以下命令
set global local_infile=true;
```

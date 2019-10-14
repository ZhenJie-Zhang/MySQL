-- 創建資料庫
CREATE DATABASE db01;
CREATE SCHEMA `db02` ;
CREATE DATABASE if not exists db01;

-- 指定使用資料庫
use db01;-- change data base

--  顯示可變換的字元集與collation
show charset;
show collation like '%big5%';

-- 變更資料庫的字元集(character set)，校對(collation) 
alter database db02 
character set big5
collate big5_bin;  

-- 顯示目前資料庫的charater set & collation
select @@character_set_database, @@collation_database;

-- 移除資料庫
drop database db02;
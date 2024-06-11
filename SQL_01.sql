create database lotus

use lotus
create table students(
	name nvarchar(50)
)

alter table students 
add id int

alter table students
add constraint primary key(id)

drop table students
drop database lotus

insert into students values('manhdz', 1),('ducmanh', 2),('trang', 3)

select * from students
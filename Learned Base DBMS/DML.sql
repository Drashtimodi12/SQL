#DML

insert into std values(0,'Sagar','sagar@gmail.com');
insert into std (name) values('Sejal');
insert into std (email) value('s@gmail.com');

update std set email='sm@gmail.com' where id = 2;

delete from std where id = 3;
#JOINS 

select book.bname, author.aname from book join author on book.aid=author.aid;
select b.bname, a.aname from book b join author a on b.aid=a.aid;

select b.bname, a.aname from book b left join author a on b.aid=a.aid;

select b.bname, a.aname from book b right join author a on b.aid=a.aid;

select b.bname, a.aname from book b left join author a on b.aid=a.aid
union
select b.bname, a.aname from book b right join author a on b.aid=a.aid;



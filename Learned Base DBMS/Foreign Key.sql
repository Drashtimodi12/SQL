#Foreign key

create table author(aid int primary key auto_increment,
					aname varchar(20)	);

INSERT INTO author (aname) VALUES ('Chetan Bhagat');
INSERT INTO author (aname) VALUES ('J.K. Rowling');
INSERT INTO author (aname) VALUES ('George Orwell');
INSERT INTO author (aname) VALUES ('Dan Brown');
INSERT INTO author (aname) VALUES ('Agatha Christie');
INSERT INTO author (aname) VALUES ('Stephen King');
INSERT INTO author (aname) VALUES ('Paulo Coelho');
INSERT INTO author (aname) VALUES ('Ravinder Singh');
INSERT INTO author (aname) VALUES ('Durjoy Datta');
INSERT INTO author (aname) VALUES ('Arundhati Roy');


create table publication(pid int primary key auto_increment,
						 pname varchar(20)	);

INSERT INTO publication (pname) VALUES ('Penguin');
INSERT INTO publication (pname) VALUES ('HarperCollins');
INSERT INTO publication (pname) VALUES ('Bloomsbury');
INSERT INTO publication (pname) VALUES ('Rupa');
INSERT INTO publication (pname) VALUES ('Macmillan');
INSERT INTO publication (pname) VALUES ('Hachette');
INSERT INTO publication (pname) VALUES ('Scholastic');
INSERT INTO publication (pname) VALUES ('Simon & Schuster');
INSERT INTO publication (pname) VALUES ('Random House');
INSERT INTO publication (pname) VALUES ('Jaico');


create table book(bid int primary key auto_increment,
				bname varchar(20),
                aid int,
                pid int,
                foreign key(aid) references author(aid),
                foreign key(pid) references publication(pid)
                );
                
alter table book modify column bname varchar(50);

INSERT INTO book (bname, aid, pid) VALUES ('2 States', 1, 4);
INSERT INTO book (bname, aid, pid) VALUES ('Harry Potter', 2, 3);
INSERT INTO book (bname, aid, pid) VALUES ('1984', 3, 1);
INSERT INTO book (bname, aid, pid) VALUES ('Inferno', 4, 2);
INSERT INTO book (bname, aid, pid) VALUES ('Murder on Nile', 5, 5);
INSERT INTO book (bname, aid, pid) VALUES ('The Shining', 6, 6);
INSERT INTO book (bname, aid, pid) VALUES ('Alchemist', 7, 10);
INSERT INTO book (bname, aid, pid) VALUES ('I Too Had a Love Story', 8, 4);
INSERT INTO book (bname, aid, pid) VALUES ('Till the Last Breath', 9, 2);
INSERT INTO book (bname, aid, pid) VALUES ('God of Small Things', 10, 1);

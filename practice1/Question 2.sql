CREATE TABLE Class (
  dept VARCHAR(6),
  number INTEGER,
  title VARCHAR(75),
  PRIMARY KEY (dept, number)
);
CREATE TABLE Instructor (
  username VARCHAR(8),
  fname VARCHAR(50),
  lname VARCHAR(50),
  started_on CHAR(10),
  PRIMARY KEY (username)
);
CREATE TABLE Teaches (
  username VARCHAR(8),
  dept VARCHAR(6),
  number INTEGER,
  PRIMARY KEY (username, dept, number),
  FOREIGN KEY (username) REFERENCES Instructor(username),
  FOREIGN KEY (dept, number) REFERENCES Class(dept, number)
);

--How many classes are being taught by at least one instructor?

select count(*)
From Teaches as T
Group By T.dept, T.number
having username != null;

--Which instructors teach more than 1 class? Give the username, first name, and last name of
--these instructors.

With Nosingle as(
  select T.username as user
  From Teaches as T
  Group By username
  Having count(*) < 2
)
select I.username, I.fname, I.lname
From Nosingle as n, Instructor as I
Where I.username not in (select n2.user
  From NoSingle as n2);

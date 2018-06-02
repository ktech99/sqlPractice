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

create table Books (
Id int primary key identity,
Name nvarchar (40) not null,
PublishDate Date,
Count int,
AuthorID int FOREIGN KEY REFERENCES Authors(Id),
)

create table Authors (
Id int primary key identity,
Name nvarchar (50) not null,
)

create table Students (
Id int primary key identity,
Name nvarchar (40) not null,
PhoneNumber nvarchar (15) not null,
StudentKey int,
FacultiesId int FOREIGN KEY REFERENCES Faculties(Id)
)

create table Faculties (
Id int primary key identity,
Name nvarchar (40),
)

create table Student_to_Books (
Id int primary key identity,
StudentsId int FOREIGN KEY REFERENCES Students(Id),
BooksId int FOREIGN KEY REFERENCES Books(Id),
GetBookDate date,
BringBookdate date
)



insert into Authors values ('Ramiz Rovsen')
insert into Authors values ('Semed Vurgun')
insert into Authors values ('Mir Celal')
insert into Authors values ('Nizami Gencevi')

select * from Authors

insert into Books values ('Qara paltarli qadin','1998-05-08',5,1)
insert into Books values ('Azerbaycan','1946-04-03',15,2)
insert into Books values ('Bir gencin manifesti','1983-11-23',23,3)
insert into Books values ('Yeddi Gozel','1152-02-03',2,4)
insert into Books values ('Xemse','1152-02-03',2,4)

select bs.Name, bs.PublishDate, bs.Count, ath.Name from Books bs
Join Authors ath
on bs.AuthorID = ath.Id
where ath.Id = 4


CREATE VIEW [StudentTakeBook] As
select st.Name[Student_Name], fs.Name[Faculties_Name], bs.Name[Books_Name], stb.BringBookdate[Deadline]  from Student_to_Books stb
Join Students st
on stb.StudentsId = st.Id
Join Faculties fs
on st.FacultiesId=fs.Id
Join Books bs
on stb.BooksId = bs.Id

select * from StudentTakeBook
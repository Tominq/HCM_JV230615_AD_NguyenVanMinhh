-- tạo dc
create
    database test;

use
    test;

-- tạo table teacher
create table teacher
(
    id       int primary key not null unique auto_increment,
    name     varchar(100)    not null unique,
    phone    varchar(50)     not null unique,
    email    varchar(50)     not null unique,
    birthday date            not null
);

-- tạo bảng class_room
create table class_room
(
    id            int primary key auto_increment,
    name          varchar(200) not null,
    total_student int default 0,
    start_date    date,
    end_date      date,
    check ( end_date > class_room.start_date )
);

-- tạo bảng teacher class
create table teacher_class
(
    teacher_id    int,
    class_rom_id  int,
    start_date    date,
    end_date      date,
    time_slot_end int,
    foreign key (teacher_id) references teacher (id),
    foreign key (class_rom_id) references class_room (id)
);

alter table teacher_class
    add time_slot_start int null;

-- tạo bảng student
create table student
(
    id            int primary key auto_increment,
    name          varchar(150) not null,
    email         varchar(100) not null unique,
    phone         varchar(50)  not null,
    gender        tinyint      not null check ( gender in (1, 2)),
    class_room_id int,
    birthday      date         not null,
    foreign key (class_room_id) references class_room (id)
);

-- tạo bảng subject

create table subject
(
    id   int primary key auto_increment,
    name varchar(200) not null unique
);

-- tạo bảng mark
create table mark
(
    student_id int not null,
    subject_id int not null,
    score      int not null check ( score >= 0 and score <= 10 ),
    foreign key (student_id) references student (id),
    foreign key (subject_id) references subject (id)
);

-- thêm dữ liệu vào bảng teacher

INSERT INTO teacher (name, email, phone, birthday)
VALUES ('Lebron James', 'john@example.com', '1234567890', '1990-01-01'),
       ('Kobe Bryant', 'jane@example.com', '9876543210', '1995-05-10'),
       ('Allen Iverson', 'david@example.com', '5555555555', '1985-07-15'),
       ('Tim Ducan', 'emily@example.com', '1111111111', '1992-11-20'),
       ('Shaq', 'michael@example.com', '9999999999', '1988-03-25');

-- thêm dữ liệu vào bảng class room

insert into class_room (name, total_student, start_date, end_date)
values ('Classroom 1', 36, '2023-09-01', '2024-01-31'),
       ('Classroom 2', 27, '2023-10-01', '2024-02-29'),
       ('Classroom 3', 46, '2023-11-01', '2024-03-31'),
       ('Classroom 4', 35, '2023-12-01', '2024-04-30'),
       ('Classroom 5', 37, '2024-01-01', '2024-05-31');

-- thêm dữ liệu vào bảng student

insert into student (name, email, phone, gender, class_room_id, birthday)
values ('Minh Nguyễn', 'Minh@gmail.com', '09876564321', 2, 1, '2002-02-15'),
       ('Tùng Chùa', 'tung@gmail.com', '0901234567', 1, 2, '2001-04-20'),
       ('Huấn Rose', 'hong@gmail.com', '0912345678', 2, 3, '1997-07-05'),
       ('Nam Lé', 'nam@gmail.com', '0978765432', 1, 4, '1999-09-10'),
       ('Hải Bánh', 'hai.banh@gmail.com', '0987654321', 2, 5, '1970-12-25'),
       ('Năm Cam', 'nam.phan@gmail.com', '0966666666', 1, 1, '1999-03-30'),
       ('Đại Cathay', 'dai@gmail.com', '0977777437', 2, 2, '1970-06-15'),
       ('Ngô Đình Diệm', 'diem.ngog@gmail.com', '0988888888', 1, 3, '1965-08-20'),
       ('Dung Hà', 'dung.ha@gmail.com', '0999999329', 2, 4, '2004-10-05'),
       ('Nguyễn Cao Kỳ', 'ky@gmail.com', '0123456789', 1, 5, '1996-11-10'),
       ('Bao Thanh Thiên', 'bao@gmail.com', '0876543210', '2', 2, '2005-01-15'),
       ('Triển Chiêu', 'trieu.chieu@gmail.com', '0111222333', 1, 1, '1995-04-20'),
       ('Công Tôn Sách', 'book.cong@gmail.com', '0333444555', '2', 3, '2003-07-05'),
       ('Bảy Viễn', 'bay@gmail.com', '0444554366', 1, 4, '1994-09-10'),
       ('Lộc fuho', 'loc.ho@gmail.com', '0555666777', 2, 5, '1998-12-25');

-- thêm d liệu bảng subject
insert into subject (name)
values ('Computer Science'),
       ('Software Development'),
       ('Machine Learning');

-- thêm dữ liệu
insert into mark (student_id, subject_id, score)
values (1, 1, 10),
       (2, 2, 8),
       (5, 3, 7),
       (4, 1, 2),
       (5, 2, 9),
       (8, 3, 5),
       (7, 1, 7),
       (10, 2, 3),
       (9, 3, 9),
       (10, 1, 6),
       (11, 2, 4),
       (12, 3, 9),
       (13, 1, 7),
       (14, 2, 3),
       (15, 3, 9),
       (11, 2, 7),
       (12, 3, 8),
       (3, 1, 9),
       (6, 2, 8),
       (1, 3, 10);

-- thêm dữ liệu vào bảng teacher class

insert into teacher_class(teacher_id, class_rom_id, start_date, end_date, time_slot_start, time_slot_end)
values (1, 1, '2023-09-01', '2024-01-31', null, null),
       (1, 2, '2023-10-01', '2024-02-29', null, null),
       (2, 1, '2023-11-01', '2024-03-31', null, null),
       (2, 3, '2023-12-01', '2024-04-30', null, null),
       (3, 2, '2024-01-01', '2024-05-31', null, null);

-- 1. Lấy ra danh sách Student có sắp xếp tăng dần theo Name gồm các cột sau
-- (Đề sai, trong đề lúc tạo bảng không có trường address)

select student.id                                       AS Id,
       student.name                                     AS Name,
       student.email                                    AS Email,
       student.phone                                    AS Phone,
       student.gender                                   AS Gender,
       student.birthday                                 AS Birthday,
       timestampdiff(YEAR, student.birthday, CURDATE()) AS Age
from student
order by student.name;

-- 2. Lấy ra danh sách Teacher gồm: Id, Name, Phone, Email, BirthDay, Age,TotalCLass

select teacher.id                                       AS Id,
       teacher.name                                     AS Name,
       teacher.phone                                    AS Phone,
       teacher.email                                    AS Email,
       teacher.birthday                                 AS Birthday,
       timestampdiff(YEAR, teacher.birthday, CURDATE()) AS Age,
       count(teacher_class.class_rom_id)                AS TotalClass
from teacher
         left join
     teacher_class ON teacher.id = teacher_class.teacher_id
group by teacher.id;

-- 3. Truy vấn danh sách class_room gồm: Id, Name, TotalStudent, StartDate,EndDate khai giảng năm 2023

select id as Id, name as Name, total_student as TatalStudent, start_date as StartDate, end_date as EndDate
from class_room
where year(start_date) = 2023;

-- Cập nhật cột TotalStudent trong bảng class_room = Tổng số Student của mỗi class_room theo Id của class_room

update class_room as cr
set cr.total_student = (select count(*) from student as s where s.class_room_id = cr.id);

-- # Tạo View v_getStudentInfo thực hiện lấy ra danh sách Student gồm: Id, Name,
-- # Email, Phone, Address, Gender, BirthDay, ClassName, MarksAvg, Trong đó cột
-- # MarksAvg hiển thị như sau:
-- # 0 < MarksAvg <=5 Loại Yếu
-- # 5 < MarksAvg < 7.5 Loại Trung bình
-- # 7.5 <= MarksAvg <= 8 Loại GIỏi
-- # 8 < MarksAvg Loại xuất sắc

create view v_getStudentInfo as
select student.id       as Id,
       student.name     as Name,
       student.email    as Email,
       student.phone    as Phone,
       student.gender   as Gender,
       student.birthday as Birthday,
       class_room.name  as ClassName,
       case
           when AVG(mark.score) > 0 and AVG(mark.score) <= 5 then 'Loại Yếu'
           when AVG(mark.score) > 5 and AVG(mark.score) < 7.5 then 'Loại Trung bình'
           when AVG(mark.score) >= 7.5 and AVG(mark.score) <= 8 then 'Loại Giỏi'
           when AVG(mark.score) > 8 then 'Loại Xuất sắc'
           else 'Không có dữ liệu'
           end          as MarksAvg
from student
         left join
     class_room ON student.class_room_id = class_room.id
         left join
     mark ON student.id = mark.student_id
group by student.id;

-- 7. Tạo thủ tục thêm mới dữ liệu vào bảng class_room

create procedure sp_InsertClassRoom(
    in p_name varchar(255),
    in p_total_student int,
    in p_start_date date,
    in p_end_date date
)
begin
    insert into class_room (name, total_student, start_date, end_date)
    values (p_name, p_total_student, p_start_date, p_end_date);
end;

-- 8. Tạo thủ tục cập nhật dữ liệu trên bảng student

create procedure sp_UpdateStudent(
    in p_id int,
    in p_name varchar(255),
    in p_email varchar(255),
    in p_phone varchar(255),
    in p_address varchar(255),
    in p_gender varchar(255),
    in p_birthday date,
    in p_class_room_id int
)
begin
    update student
    set name          = p_name,
        email         = p_email,
        phone         = p_phone,
        gender        = p_gender,
        birthday      = p_birthday,
        class_room_id = p_class_room_id
    where id = p_id;
end;

-- 9. Tạo thủ tục xóa dữ liệu theo id trên bảng subject

create procedure sp_DeleteSubject(
    in p_id int
)
begin
    delete
    from subject
    where id = p_id;
end;

-- # 10. Tạo thủ tục getStudentPaginate lấy ra danh sách sinh viên có phân trang gồm:
-- # Id, Name, Email, Phone, Address, Gender, BirthDay, ClassName, Khi gọi thủ tuc
-- # truyền vào limit và page

create procedure getStudentPaginate(
    in p_limit int,
    in p_page int
)
begin
    declare
        start_index int;

    set
        start_index = (p_page - 1) * p_limit;

    select student.id       as Id,
           student.name     as Name,
           student.email    as Email,
           student.phone    as Phone,
           student.gender   as Gender,
           student.birthday as BirthDay,
           class_room.name  as ClassName
    from student
             left join
         class_room on student.class_room_id = class_room.id
    limit start_index, p_limit;
end;
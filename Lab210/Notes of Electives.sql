Таблица Exams содержит информацию об экзаменах:  
 - idExam - id экзамена. Тип данных: Int; Primary Key, NOT NULL, AUTO_INCREMENT; 
 - Appellation - название экзамена. Тип данных: VARCHAR

Таблица Exams has Students содержит информация о прошедших экзаменах:
- idExam - id экзамена. Тип данных: Int; Primary Key, NOT NULL;
- idStudent - id студента. Тип данных: Int; Primaty Key, NOT NULL;
- Rating - оценка студента за экзамен. Тип данных: Int;
 
Таблица Students содержит информацию о студентах: 
 - idStudent - id студента. Тип данных: Int; Primary Key, NOT NULL, AUTO_INCREMENT;
 - Name - Имя студента. Тип данных: VARCHAR;
 - Surname - Фамилия студента. Тип данных: VARCHAR;
 - Patronymic - Отчество студента. Тип данных: VARCHAR;
 - Addres - Адрес студента. Тип данных: VARCHAR;
 - Phone - Мобильный телефон студента: Тип данных: VARCHAR;
 - Attend Electives - Посещаемые студентом факультативы. Тип данных: Int. 
 
Таблица Electives has Students содержит информацию о факультативах, которые посещают студенты:
 - idElective - id факультатива. Тип данных: Int; Primaty Key, NOT NULL;
 - idStudent - id студента. Тип данных: Int, Primaty Key, NOT NULL;
 
Таблица Electives содержит информацию о факультативах:
 - idElective - id факультатива. Тип данных: Int; Primary Key, NOT NULL, AUTO_INCREMENT;
 - Appellation - название факультатива. Тип данных VARCHAR;
 - Practice Time - количество часов практических занятий. Тип данных: Int;
 - Laboratory Work Time - количество часов лабораторных занятий. Тип данных: Int;
 - Lecture Time - количество часов лекционных занятий. Тип данных: Int.
 
 Таблица Teachers содержит информацию о преподавателях: 
 - idTeacher - id преподавателя. Тип данных: Int; Primary Key, NOT NULL, AUTO_INCREMENT;
 - Name - имя преподавателя. Тип данных: VARCHAR;
 - Surname - фамилия преподавателя. Тип данных: VARCHAR;
 - Patronymic - отчество преподавателя. Тип данных: VARCHAR;
 - Discipline - преподаваемая дисциплина преподавателя. Тип данных: VARCHAR;
 
 Обоснование связей: 
 - Связь таблицы Exams к таблице Students - n:m. У одного студента может существовать больше одного экзамена. А экзамен могут сдавать один и больше студентов. Поэтому появилась связующая таблица Exams has Students.
 - Связь таблицы Electives к таблице Students - n:m. Один студент может посещать несколько факультативов. Так же и один факультатив могут посещать много студентов. Поэтому появилась связующая таблица Electives has Students. 
 - Связь таблицы Electives к таблице Teachers - 1:1. Один факультатив может проводить только один преподаватель. Аналогично и преподаватель может проводить только один факультатив. 
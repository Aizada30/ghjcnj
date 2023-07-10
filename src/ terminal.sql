Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]: postgres
Пароль пользователя postgres:
psql (15.3)
ПРЕДУПРЕЖДЕНИЕ: Кодовая страница консоли (866) отличается от основной
                страницы Windows (1251).
                8-битовые (русские) символы могут отображаться некорректно.
                Подробнее об этом смотрите документацию psql, раздел
                "Notes for Windows users".
Введите "help", чтобы получить справку.

postgres=#
postgres=# create table hospital (id serail primary key, name_of_hospital varchar);
ОШИБКА:  тип "serail" не существует
СТРОКА 1: create table hospital (id serail primary key, name_of_hospit...
                                 ^
                                 postgres=# create table hospitals (id serial primary key, name_of_hospital varchar);
ОШИБКА:  отношение "hospitals" уже существует
postgres=# insert into city (name_of_city) values ('Bishkek');
INSERT 0 1
postgres=# insert into city (name_of_city) values ('London');
INSERT 0 1
postgres=# insert into city (name_of_city) values ('Paris');
INSERT 0 1
postgres=# insert into city (name_of_city) values ('Kanada');
INSERT 0 1
postgres=# insert into address(name_of_country, name_of_city);
ОШИБКА:  ошибка синтаксиса (примерное положение: ";")
СТРОКА 1: insert into address(name_of_country, name_of_city);
^
postgres=# insert into address (name_of_country,name_of_city) values ('Angliya',2);
                                               ^
postgres=# insert into address (name_of_country,name_of_citu) values ('Angliya',2);
INSERT 0 1
postgres=# insert into address(name_of_country , name_of_citu) values ('France',3);
INSERT 0 1
postgres=# insert into address (name_of_country , name_of_citu) values ('Kg');
ОШИБКА:  INSERT содержит больше целевых столбцов, чем выражений
СТРОКА 1: insert into address (name_of_country , name_of_citu) values ...
                                                 ^
postgres=# insert into address(name_of_country, name_of_citu) values ('Kg',1
);
INSERT 0 1
postgres=# select from * address;
ОШИБКА:  ошибка синтаксиса (примерное положение: "*")
СТРОКА 1: select from * address;
                      ^
postgres=# select * from address;
 id | name_of_country | name_of_citu
----+-----------------+--------------
  1 | Angliya         |            2
  2 | France          |            3
  3 | Kg              |            1
(3 ёЄЁюъш)


postgres=# drop table address;
ОШИБКА:  удалить объект таблица address нельзя, так как от него зависят другие объекты
ПОДРОБНОСТИ:  ограничение patients_house_of_person_fkey в отношении таблица patients зависит от объекта таблица address
ПОДСКАЗКА:  Для удаления зависимых объектов используйте DROP ... CASCADE.
postgres=# drop table pharmacy ;
ОШИБКА:  таблица "pharmacy" не существует
postgres=# drop table pharmacys;
DROP TABLE
postgres=# drop table hospitals;
DROP TABLE
postgres=# drop table address;
ОШИБКА:  удалить объект таблица address нельзя, так как от него зависят другие объекты
ПОДРОБНОСТИ:  ограничение patients_house_of_person_fkey в отношении таблица patients зависит от объекта таблица address
ПОДСКАЗКА:  Для удаления зависимых объектов используйте DROP ... CASCADE.
postgres=# drop table address cascade;
ЗАМЕЧАНИЕ:  удаление распространяется на объект ограничение patients_house_of_person_fkey в отношении таблица patients
DROP TABLE
postgres=# drop table city cascade;
ЗАМЕЧАНИЕ:  удаление распространяется на объект ограничение countrys_city_in_country_fkey в отношении таблица countrys
DROP TABLE
postgres=# drop table countrys;
DROP TABLE
postgres=# drop table department;
ОШИБКА:  удалить объект таблица department нельзя, так как от него зависят другие объекты
ПОДРОБНОСТИ:  ограничение doctor_doctors_department_fkey в отношении таблица doctor зависит от объекта таблица department
ПОДСКАЗКА:  Для удаления зависимых объектов используйте DROP ... CASCADE.
postgres=# drop table department cascade;
ЗАМЕЧАНИЕ:  удаление распространяется на объект ограничение doctor_doctors_department_fkey в отношении таблица doctor
DROP TABLE
postgres=# drop table patinets
postgres-# drop table patients;
ОШИБКА:  ошибка синтаксиса (примерное положение: "drop")
СТРОКА 2: drop table patients;
          ^
postgres=# drop table patients;
ОШИБКА:  удалить объект таблица patients нельзя, так как от него зависят другие объекты
ПОДРОБНОСТИ:  ограничение doctor_patient_of_doctor_fkey в отношении таблица doctor зависит от объекта таблица patients
ПОДСКАЗКА:  Для удаления зависимых объектов используйте DROP ... CASCADE.
postgres=# drop table parients carcade;
ОШИБКА:  ошибка синтаксиса (примерное положение: "carcade")
СТРОКА 1: drop table parients carcade;
                              ^
postgres=# drop table medicines carcade;
ОШИБКА:  ошибка синтаксиса (примерное положение: "carcade")
СТРОКА 1: drop table medicines carcade;
                               ^
postgres=# drop table medicines ;
DROP TABLE
postgres=# drop table doctor;
DROP TABLE
postgres=# drop table patients;
DROP TABLE
postgres=# create table create table countrys2 (id serial primary key, name_
of_country varchar);
ОШИБКА:  ошибка синтаксиса (примерное положение: "create")
СТРОКА 1: create table create table countrys2 (id serial primary key, ...
                       ^
postgres=# create table countrys2(id serial primary key, name_of_country var
char);
CREATE TABLE
postgres=# insert into countrys2(name_of_country) values ('KG');
INSERT 0 1
postgres=# insert into countrys2(name_of_country) values ('Angliya');
INSERT 0 1
postgres=# insert into countrys2(name_of_country) values ('France');
INSERT 0 1
postgres=# create table citys(id serial primary key , name_of_city varchar ,
country int references countrys2(id));
CREATE TABLE
postgres=# insert into citys(name_of_city , country) values ('Bishkek', '1')
;
INSERT 0 1
postgres=# insert into citys(name_of_city, country) values ('Paris',3);
INSERT 0 1
postgres=# insert into city(name_of_city,country) values ('London',2);
ОШИБКА:  отношение "city" не существует
СТРОКА 1: insert into city(name_of_city,country) values ('London',2);
                      ^
postgres=# insert into citys(name_of_city, country) values ('London',2);
INSERT 0 1
postgres=# create table addresses(id serial primaty key, name varchar, city
int references citys (id));
ОШИБКА:  ошибка синтаксиса (примерное положение: "primaty")
СТРОКА 1: create table addresses(id serial primaty key, name varchar, ...
                                           ^
postgres=# create table addresses (id serial primary key, name varchar, city
 int references citys (id));
ОШИБКА:  отношение "addresses" уже существует
postgres=# create table addresses2 (id serial primary key, name varchar , ci
ty int references citys (id));
CREATE TABLE
postgres=# insert into addresses2 ( name , city ) values ('Bokobaeva',1);
INSERT 0 1
postgres=# insert into addresses2 (name, city) values ('Baker street',2);
INSERT 0 1
postgres=# insert into addresses2 (name, city) values ('Francus',3 );
INSERT 0 1
postgres=# create table hospitals (id serial primary key, name varchar , city int references citys(id));
CREATE TABLE
postgres=# insert into hospitals (name , city) values ('center hosptial ',2)

postgres-# ;
INSERT 0 1
postgres=# insert into hospitals (name, city) values ('citys hospital ', 1);

INSERT 0 1
postgres=# insert into hospitals (name, city)values ('privaty hospital ',3);

INSERT 0 1
postgres=# create table department (id serial primary key , name varchar , h
ospital int references hospitals (id));
CREATE TABLE
postgres=# insert into department (name , hospital ) values ('Pediators' ,3);
INSERT 0 1
postgres=# insert into department (name, hospital) values ('Dentists',2);
INSERT 0 1
postgres=# insert into department (name, hospital) values ('Lor',1);
INSERT 0 1
postgres=# create table house_number (id serial primary key, house_number in
t,person int references patients (id));
ОШИБКА:  отношение "patients" не существует
postgres=# create table patients(id serial primary key , first_name varchar
, last_name varchar, department int references department(id));
CREATE TABLE
postgres=# insert into patients (first_name , last_name, department) values ('Aiturgan ', ' Kurmanbekova',1);
INSERT 0 1
postgres=# insert into patients (first_name, last_name,department )values (' Meerim ', ' Rahmanova',2);
INSERT 0 1
postgres=# insert into patients (first_name, last_name, department ) values('Raina ', 'Jusupbaeva',3);
INSERT 0 1
postgres=# create table doctors (id serial primary key, firstName varchar , lastName varchar , department int references patients (id));
CREATE TABLE
postgres=# insert into doctors (firstName, lastName, department) values ('Hi
ro', 'Hirokava',2);
INSERT 0 1
postgres=# insert into doctors (firstName , lastName, department) values ('Midorya','Deku',3);
INSERT 0 1
postgres=# create table house (id serial primary key , number int , person int references patients (id));
CREATE TABLE
postgres=# insert into house (number, person ) values (21,1);
INSERT 0 1
postgres=# insert into house (number,person) values (63,2,;
postgres(# )
postgres-# insert into house (number, person ) values (34,2);
ОШИБКА:  ошибка синтаксиса (примерное положение: ";")
СТРОКА 1: insert into house (number,person) values (63,2,;
                                                         ^
postgres=# insert into house ( number , person ) values ( 52,3);
INSERT 0 1
postgres=# insert into house ( number , person ) values ( 45,2);
INSERT 0 1
postgres=# create table pharmacys( id serial primary key ,number int , hospital int references hospitals(id));
CREATE TABLE
postgres=# insert into pharmacys ( number, hospital ) values ( 11,2);
INSERT 0 1
postgres=# insert into pharmacys ( numbher , hospital ) values ( 22,3);
ОШИБКА:  столбец "numbher" в таблице "pharmacys" не существует
СТРОКА 1: insert into pharmacys ( numbher , hospital ) values ( 22,3);
                                  ^
postgres=# insert into pharmacys ( number , hospital ) values  (22,3);
INSERT 0 1
postgres=# insert into pharmacys ( number , hospital ) values (33,1);
INSERT 0 1
postgres=# create table medicines ( id serial primary key , name varchar , p
harmacy int references pharmacys (id));
CREATE TABLE
postgres=# insert into medicines ( name , pharmacy ) values ( 'vitamin ', 1)
;
INSERT 0 1
    postgres=# insert into medicines ( name , pharmacy ) values ( 'trimol', 2);
    INSERT 0 1
    postgres=# insert into medicines ( name , pharmacy ) values ( 'trimol', 3);
    INSERT 0 1
    postgres=#



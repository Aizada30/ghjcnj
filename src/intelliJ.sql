create table address
(
    id           serial primary key,
    house_number int,
    street       varchar,
    city         varchar,
    country      varchar

);

create table phone
(
    id              serial primary key,
    name_of_phone   varchar,
    number_of_phone integer
);

create table email
(
    id            serial primary key,
    name_of_email varchar unique
);

create table person
(
    id                serial primary key,
    first_name        varchar,
    last_name         varchar,
    age_of_person     integer,
    email_of_person   int references emails (id),
    address_of_person int references addresses (id),
    phone_of_person   int references phones (id)
);

create table employees
(
    id       serial primary key,
    employee int references persons (id)
);

create table description
(
    id          serial primary key,
    description varchar
);

create table product
(
    id                  serial primary key,
    name_of_product     varchar,
    product_owner       int references persons (id),
    product_description int references descriptions (id)
);


create table company
(
    id                  serial primary key,
    name_of_company     varchar,
    address_of_company  int references addresses (id),
    emplayee_of_company int references employees (id),
    product_            int references product (id)
);

create table gym
(
    id             serial primary key,
    name_of_gym    varchar,
    guests         int references persons (id),
    address_of_gym int references addresses (id)
);

create table shops
(
    id              serial primary key,
    name_of_shop    varchar,
    address_of_shop int references addresses (id)
);

insert into addresses (house_number, street, city, country)
values (21, 'Beaker street', 'London', 'Anglia');

insert into addresses(house_number, street, city, country)
values (36, 'Manas street', 'Bishkek', 'Kyrgyzstan');

insert into addresses(house_number, street, city, country)
values (12, 'Bethowen street', 'Berlin', 'Germany');

insert into phones(name_of_phone, number_of_phone)
values ('REDMI not 12', 0558870024);

insert into phones(name_of_phone, number_of_phone)
values ('SAMSUNG GALAXY s23', 0705132442);

insert into phones(name_of_phone, number_of_phone)
values ('IPHONE pro 14', 0702363695);

insert into emails(name_of_email)
values ('person@gmail.com');
insert into emails(name_of_email)
values ('NotFirstEmail@gmail.com');
insert into emails(name_of_email)
values ('NotSecondEmail@gmal.com');
insert into emails(name_of_email)
values ('rahmanova@gmai.com');

insert into persons(first_name, last_name, age_of_person, email_of_person, address_of_person, phone_of_person)
values ('Meerim', 'Rahmanova', 19, 4, 1, 3);

insert into persons(first_name, last_name, age_of_person, email_of_person, address_of_person, phone_of_person)
values ('Aiturgan', 'Kurmanbekova', 20, 2, 2, 2);

insert into persons(first_name, last_name, age_of_person, email_of_person, address_of_person, phone_of_person)
values ('Aizada', 'Abdyrazakova', 21, 3, 3, 3);

insert into employees(employee)
values (1);
insert into employees(employee)
values (2);
insert into employees(employee)
values (3);

update employees
set employee= 3
WHERE id = 2;
update employees
set employee= 1
WHERE id = 3;
update employees
set employee= 2
WHERE id = 1;

insert into companys(name_of_company, address_of_company, emplayee_of_company)
values ('Amazon', 2, 1);
insert into companys(name_of_company, address_of_company, emplayee_of_company)
values ('Google', 1, 2);
insert into companys(name_of_company, address_of_company, emplayee_of_company)
values ('Microsoft', 3, 3);



insert into gyms (name_of_gym, guests, address_of_gym)
values ('Change fitness', 1, 2);
insert into gyms (name_of_gym, guests, address_of_gym)
values ('Monro', 2, 3);
insert into gyms (name_of_gym, guests, address_of_gym)
values ('Life fitness', 3, 1);

insert into descriptions(description)
values ('очень хорошо способствует для ления кожи');
insert into descriptions(description)
values ('помогает быстро и эффективно помогает освоиться в новом городе');
insert into descriptions(description)
values ('новая защита ,новые возможности');

insert into product (name_of_product, product_owner, product_description)
values ('masks', 3, 1);
insert into product (name_of_product, product_owner, product_description)
values ('герой-щита', 1, 3);
insert into product (name_of_product, product_owner, product_description)
values ('map-ultra', 2, 2);

delete
from product
where id = 4;



insert into shops(name_of_shop, address_of_shop, prosuct_for_shop)
values ('Optovye ceny', 1, 1);
insert into shops(name_of_shop, address_of_shop, prosuct_for_shop)
values ('START', 2, 2);
insert into shops(name_of_shop, address_of_shop, prosuct_for_shop)
values ('Optovye ceny', 3, 3);



alter table shops
    add prosuct_for_shop int references product (id);

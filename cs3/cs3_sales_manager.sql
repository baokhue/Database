create database cs3_sales_manager;
use cs3_sales_manager;
create table customer (
	c_id int primary key,
    c_name varchar(50),
    c_age int
);
create table order_primary (
	o_id int primary key,
    o_date date,
    o_total_price int not null,
    fk_c_id int,
    foreign key (fk_c_id) references customer(c_id)
);
create table product (
	p_id int primary key,
    p_name varchar(50),
    p_price int not null
);
-- CUSTOMER
insert into customer 
values (1, 'Minh Quan', 10);
insert into customer 
values (2, 'Ngoc Oanh', 20);
insert into customer 
values (3, 'Hoang Ha', 50);

-- ORDER
insert into order_primary
values (1, '2006-3-21', 1, null), (2, '2006-3-23', 2, Null), (3, '2006-3-16', 1, null);

-- PRODUCT
insert into product
values(1, 'May Giat', 3), (2, 'Tu Lanh', 5), (3, 'Dieu Hoa', 7), (4, 'Quat', 1), (5, 'Bep Dien', 2);

-- ORDER DETAIL
insert into order_detail
values(1, 1, 3), (1, 3, 7), (1, 4, 2), (2, 1, 1), (3, 1, 8), (2, 5, 4), (2, 3, 3);

create table order_detail (
	od_qty int,
	fk_o_id int,
    fk_p_id int,
    primary key (fk_o_id, fk_p_id),
    foreign key (fk_o_id) references order_primary(o_id),
    foreign key (fk_p_id) references product(p_id)
);
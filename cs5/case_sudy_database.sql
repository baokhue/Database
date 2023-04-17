create database case_study;
use case_study;
create table position (
p_id int not null auto_increment primary key,
p_name varchar(45)
);

create table education (
e_id int not null auto_increment primary key,
e_name varchar(45)
);

create table department (
d_id int not null primary key,
d_name varchar(45)
);

create table position (
p_id int not null auto_increment primary key,
p_name varchar(45)
);

create table education (
e_id int not null auto_increment primary key,
e_name varchar(45)
);

create table department (
d_id int not null auto_increment primary key,
d_name varchar(45)
);

create table worker (
w_id int not null auto_increment primary key,
w_full_name varchar(45),
w_birthday date,
w_id_card_number varchar(45),
w_salary double,
w_phone_number varchar(45),
w_email varchar(45),
w_address varchar(45),
p_id int,
e_id int,
d_id int,
foreign key (p_id) references position (p_id),
foreign key (e_id) references education (e_id),
foreign key (d_id) references department (d_id)
);

create table customer_type (
ct_id int not null auto_increment primary key,
ct_name varchar(45)
);

create table customer (
c_id int not null auto_increment primary key,
ct_id int,
c_full_name varchar(45),
c_birthday date,
c_gender bit(1),
c_id_card_number varchar(45),
c_phone_number varchar(45),
c_email varchar(45),
c_address varchar(45),
foreign key (ct_id) references customer_type (ct_id)
);

create table service_type (
st_id int not null auto_increment primary key,
st_name varchar(45)
);

create table service_method (
sm_id int not null auto_increment primary key,
sm_name varchar(45)
);

create table service (
s_id int not null auto_increment primary key,
s_name varchar(45),
s_square int,
s_rent double,
s_persons int,
sm_id int,
st_id int,
s_room_standard varchar(45),
s_other_convinient varchar(45),
s_pool_square double,
s_floor int,
foreign key (sm_id) references service_method (sm_id),
foreign key (st_id) references service_type (st_id)
);

create table agreement (
a_id int not null auto_increment primary key,
a_valid_date datetime,
a_invalid_date datetime,
a_deposit double,
w_id int,
c_id int,
s_id int,
foreign key (w_id) references worker (w_id),
foreign key (c_id) references customer (c_id),
foreign key (s_id) references service (s_id)
);

create table accompanied_service (
as_id int not null auto_increment primary key,
as_name varchar(45),
as_price double,
as_unit varchar(10),
as_status varchar(45)
);

create table detail_agreement (
da_id int not null auto_increment primary key,
a_id int,
as_id int,
da_numbers int,
foreign key (a_id) references agreement (a_id),
foreign key (as_id) references accompanied_service (as_id)
);
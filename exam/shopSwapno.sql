create table product_type(
	pt_id integer constraint pt_pk primary key,
	name varchar2(25) not null
);

insert into product_type values(1,'food');
insert into product_type values(2,'Cloth');
insert into product_type values(3,'toy');


create table product(
	pr_id integer constraint pr_pk primary key,
	pt_id integer constraint pr_pt_id_fk references product_type(pt_id),
	name varchar2(15) not null,
	description varchar2(15),
	price integer not null
);

create sequence product_sq nocache;

insert into product values(product_sq.nextval-1,1,'mango','abcd',10);
insert into product values(product_sq.nextval-1,1,'rice','abcd',20);
insert into product values(product_sq.nextval-1,1,'fish','abcd',30);
insert into product values(product_sq.nextval-1,2,'shirt','abcd',40);
insert into product values(product_sq.nextval-1,2,'panjabi','abcd',50);
insert into product values(product_sq.nextval-1,2,'sharee','abcd',60);
insert into product values(product_sq.nextval-1,3,'car','abcd',70);
insert into product values(product_sq.nextval-1,3,'plane','abcd',80);
insert into product values(product_sq.nextval-1,3,'football','abcd',90);

create table customer(
	voterId integer constraint customer_pk primary key,
	first_name varchar2(15) not null,
	last_name varchar2(15) not null,
	address varchar2(25),
	phone integer
);

insert into customer values(1,'karim','mia','sylhet',123456);
insert into customer values(2,'rahim','mia','sylhet',123456);
insert into customer values(3,'jodu','mia','sylhet',123456);
insert into customer values(4,'modhu','mia','dhaka',123456);

create table employee(
	voterId integer constraint employee_pk primary key,
	managerId integer,
	first_name varchar2(15) not null,
	last_name varchar2(15) not null,
	post varchar2(15) not null,
	salary integer
);

insert into employee(voterId,managerId,first_name,last_name,post,salary) values(1,1,'baker','mia','MD',50000);
insert into employee(voterId,first_name,last_name,post,salary) values(2,'rimon','mia','worker',15000);

create sequence purchase_sq nocache;

create table purchase(
	purchase_id integer constraint purchase_pk primary key,
	voterId integer constraint pur_cust_fk references customer(voterId),
	pt_id integer constraint prc_pt_id_fk references product_type(pt_id),
	pr_id integer constraint prc_pr_id_fk references product(pr_id),
	quantity integer not null,
	prdate date not null
);

insert into purchase values(purchase_sq.nextval-1,1,1,1,10,'01-JAN-2016');
insert into purchase values(purchase_sq.nextval-1,1,2,2,10,'01-JAN-2016');
insert into purchase values(purchase_sq.nextval-1,2,3,3,10,'01-JAN-2016');
insert into purchase values(purchase_sq.nextval-1,3,1,2,10,'01-FEB-2016');
insert into purchase values(purchase_sq.nextval-1,2,1,2,10,'01-FEB-2016');
insert into purchase values(purchase_sq.nextval-1,4,3,1,10,'01-MAR-2016');
insert into purchase values(purchase_sq.nextval-1,4,2,2,10,'01-JAN-2016');
insert into purchase values(purchase_sq.nextval-1,3,2,3,10,'01-JAN-2016');

commit;

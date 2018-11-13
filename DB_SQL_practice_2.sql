		create table student(
			st_id integer constraint st_id_pk PRIMARY key,
			st_name varchar2(30) not null,
			address varchar2(50),
			phone number(11,0),
			dept varchar2(5) not null,
			ssn integer not null	
		);
		create table teacher(
			te_id integer constraint te_id_pk PRIMARY key,
			te_name varchar2(30) not null,
			address varchar2(50),
			phone number(11,0),
			dept varchar2(5) not null
		);
		create table course(
			crs_id integer constraint crs_id_pk PRIMARY key,
			crs_code varchar2(8) not null,
			crs_title varchar2(50) not null,
			credit number(5,2) not null
		);
		create table results(
			st_id integer constraint st_id_fk references student(st_id),
			te_id integer constraint te_id_fk references teacher(te_id),
			crs_id integer constraint crs_id_fk references course(crs_id),
			marks number(5,2) not null,
			constraint re_id_pr PRIMARY key(st_id, te_id, crs_id)
		);
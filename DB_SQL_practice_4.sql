create user university identified by 1;

grant connect, resource to university;

describe student

CREATING tABLE:

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
			crs_code varchar2(6) not null,
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


		
CLEAR SCREEN: cl scr;

INSERT INTO TABLE:

insert into
student(st_id, st_name, dept, ssn)
values(14031002, 'sorna', 'bba', 7);
	
		insert into student
		values(14020001, 'joti', 'sylhet', 12345, 'cse', 6);
		insert into student
		values(14020002, 'raihan', 'sylhet', 12346, 'cse', 6);
		insert into student
		values(14020003, 'smriti', 'komilla', 12347, 'cse', 6);
		insert into student
		values(14020004, 'pranto', 'netrokuna', 12348, 'cse', 6);
		insert into student
		values(14020005, 'topu', 'bissonat', 12349, 'cse', 6);
		insert into student
		values(14030001, 'sirat', 'hetimgong', 12351, 'cse', 7);
		insert into student
		values(14030003, 'tasnim', 'hetimgong', 12352, 'cse', 7);
		insert into student
		values(14021001, 'kuddus', 'Sylhet', 12353, 'bba', 6);
		insert into student
		values(14021002, 'mokles', 'dhaka', 12354, 'bba', 6);
		insert into student
		values(14031001, 'rahima', 'dhaka', 12355, 'bba', 7);

		insert into teacher
		values(101, 'Shahid sir', 'maymansing', 11111, 'cse');
		insert into teacher
		values(102, 'Ahsan sir', 'maymansing', 11112, 'cse');
		insert into teacher
		values(103, 'Tithy mam', 'sylhet', 11113, 'cse');
		insert into teacher
		values(104, 'Saadat sir', 'moulvibazar', 11114, 'cse');
		insert into teacher
		values(201, 'Jasim sir', 'N/A', 11115, 'bba');
		insert into teacher
		values(202, 'manni mam', 'brunai', 11116, 'bba');
		insert into teacher
		values(203, 'khaled sir', 'moulvibazar', 11117, 'bba');
		
		insert into course 
		values(1001, 'cse 113', 'c', 3.00);
		insert into course 
		values(1002, 'cse 114', 'c lab', 1.5);
		insert into course 
		values(1003, 'cse 131', 'data structure', 3.00);
		insert into course 
		values(1004, 'cse 132', 'data structure lab', 1.5);
		insert into course 
		values(1005, 'cse 231', 'algorithm', 3.0);
		insert into course 
		values(1006, 'cse 232', 'algorithm lab', 1.5);
		insert into course 
		values(1007, 'bba 101', 'principles of economics', 3.0);
		insert into course 
		values(1008, 'bba 102', 'principles of accounting', 3.0);
		
		cse...
		insert into results
		values(14020001, 101, 1001, 70);
		insert into results
		values(14020002, 101, 1001, 90);
		insert into results
		values(14020003, 101, 1001, 100);
		insert into results
		values(14020001, 101, 1002, 80);
		insert into results
		values(14020002, 101, 1002, 85);
		insert into results
		values(14020003, 101, 1002, 95);
		bba.......
		insert into results
		values(14021001, 202, 1007, 97);
		insert into results
		values(14021002, 202, 1007, 86);
		insert into results
		values(14031001, 202, 1007, 100);


		select s.st_name, r.results from student s, results r where s.st_id = r.st_id;
		
		
DELETING DATA......
	delete from results where crs_id=1007;
	delete phone from student where st_id=14021001;

	
	
....CHANGE A Column_Size:
		alter table course modify crs_code varchar2(8);

		
		
....UPDATE a ROW:
		update course
			set crs_code = 'cse 113'
			where crs_id = 1001;
			
			
....SELECT QUERY:
		
		select st_id, dept from student; 
		select st_id, dept from student order by dept; 
		select st_id, st_name from student where dept='cse';
		select st_id, st_name from student where dept='bba';
		
		select te_name, phone, dept from teacher order by dept;
		
		select crs_code, crs_title from course;
		
		
....JOINING:
		select st_name from student s, results r where s.st_id=r.st_id and r.marks>79;
		
		select s.st_name, r.marks from student s, results r where s.st_id=r.st_id;
		
		ST_NAME                             MARKS
		------------------------------ ----------
		raihan                                 85
		raihan                                 90
		smriti                                 95
		smriti                                100
		kuddus                                 97
		mokles                                 86
		rahima                                100
		
		

	select s.st_name, t.te_name, c.crs_title, r.marks from student s, teacher t, course c, results r where s.st_id=r.st_id and t.te_id=r.te_id and c.crs_id=r.crs_id;	


		ST_NAME				TE_NAME				CRS_TITLE				MARKS
		------------------------------ -------------------------------------------------------
		raihan            Shahid sir			c lab                  		85

		raihan			  Shahid sir			c                           90

		smriti            Shahid sir			c lab                       95

		smriti            Shahid sir			c                           100

		kuddus            manni mam				principles of economics     97

		mokles            manni mam				principles of economics     86

		rahima            manni mam				principles of economics     100
	
		
		
		select st_name from student s, results r where s.st_id=r.st_id and r.marks>79 order by s.st_id;
		ST_NAME
		-------
		raihan
		raihan
		smriti
		smriti
		kuddus
		mokles
		rahima

		
....AGGREATION:

		select count(st_id) from student;
		select count(distinct  address) from student;
		
		select max(marks) from results;
		select min(marks) from results;
		
		select sum(marks) from results;
		select avg(marks) from results;
		
		
....GROUP BY:		
	select crs_id, avg(marks) from results group by crs_id;
		
		
		
....AGGREATION with JOINING:

	select avg(marks) from results;
	AVG(MARKS)
	----------
	93.2857143
		
 
	select count(r.st_id) from course c, results r where c.crs_id=r.crs_id and c.crs_code='bba 101' and r.marks>79;	
	COUNT(R.ST_ID)
	--------------
    3	
		
	
	//select st_id from student, result_holder rh where rh.marks=(select max(r.marks) from course c, results r where c.crs_id=r.crs_id and c.crs_title='c lab'); 
		

		
....SELECT QUERY USING GROUP BY:
	
			select avg(marks) from results group by crs_id;
			AVG(MARKS)
			----------
					95
					90
			94.3333333
			
			select avg(marks) from results group by te_id;
			AVG(MARKS)
			----------
				  92.5
			94.3333333
			
			select avg(marks) from results group by st_id;
			AVG(MARKS)
			----------
				  87.5
					97
				   100
					86
				  97.5
			
			
			select te_id, avg(marks) from results group by te_id;
			TE_ID 		AVG(MARKS)
			------     ------------
			101      	92.5
			202 		94.3333333
			
			
			select crs_id, avg(marks) from results group by crs_id having crs_id<=1002;
			CRS_ID 		AVG(MARKS)
			-------		----------
			1001        95
			1002        90



	select st-id,st_name, avg(marks) from results group by st_id;
		
		//select s.st_id, s.st_name, avg(marks) from results r, student s where s.st_id=r.st_id group by s.st_id;
		
		select crs_id, avg(marks) from results group by crs_id;
		
		  
		
		select st_id, avg(marks) from results group by st_id having avg(marks)>74 and st_id = 14020003;
		

		
		//select s.st_name, avg(r.marks) from results r, student s where r.st_id=s.st_id group by s.st_id having avg(r.marks)>79;
		
		
		
....LIKE:

		select te_name from teacher where te_name like '_____d%';
		TE_NAME
		-----------
		Shahid sir
		khaled sir
		
		select st_name from student where st_name like 's%';
		ST_NAME
		----------
		smriti
		sirat
		
		select st_name from student where st_id like '14%';
		ST_NAME
		--------
		raihan
		smriti
		pranto
		topu
		sirat
		tasnim
		kuddus
		mokles
		rahima
		
		select st_name from student where st_id like '14____01';
		ST_NAME
		--------------
		sirat
		kuddus
		rahima

		
		select crs_id, crs_title, credit from course where crs_title like '%lab';
		CRS_ID 		CRS_TITLE					CREDIT
		-------    --------------------------	---------
		1002 		c lab                       1.5
		1004 		data structure lab          1.5
		1006 		algorithm lab               1.5

		
		
....IN:

	select st_id, st_name from student where ssn IN(7);
    ST_ID 		ST_NAME
	---------- 	-----------
	14030001 	sirat
	14030003 	tasnim
	14031001 	rahima

  
	select st_id, st_name from student where ssn IN(6,7);
    ST_ID 		ST_NAME
	---------- 	------------------------------
	14020002 	raihan
	14020003 	smriti
	14020004 	pranto
	14020005 	topu
	14030001 	sirat
	14030003 	tasnim
	14021001 	kuddus
	14021002 	mokles
	14031001 	rahima

		
		
....BETWEEN:

	select st_id, ssn from student where ssn between 5 and 7;
    ST_ID        	SSN
	---------- 	   ----------
	14020002        6
	14020003        6
	14020004        6
	14020005        6
	14030001        7
	14030003        7
	14021001        6
	14021002        6
	14031001        7
		
		 
....REPLACING NULL VALUE:

		select st_id, NVL(phone, -11111) as Phone from student where dept='bba';
		ST_ID         PHONE
		---------- 	 --------
		14021001      12353
		14021002      12354
		14031001      12355
		14031002     -11111
		
		
		select st_id, NVL(address, 'No Address') from student where dept = 'bba';
		ST_ID 		NVL(ADDRESS,'NOADDRESS')
		---------- 	--------------------------------------------------
		14021001 	Sylhet
		14021002 	dhaka
		14031001 	dhaka
		14031002 	No Address


....SUB QUERY:
			select st_id from results where marks>(select avg(marks) from student);


			select c.crs_title, aplus.aplus_holder from course c, (select crs_id, count(marks) aplus_holder from results where marks>79 group by crs_id having crs_id IN (select crs_id from course where crs_title='c')) aplus where c.crs_id=aplus.crs_id;


			select te_id, avg(marks) from results group by te_id having te_id = (select te_id from teacher where te_name='Saadat sir');


			select teacher.te_name, temp.avgMarks from teacher, (select te_id, avg(marks) avgMarks from results group by te_id having te_id=(select te_id from teacher where te_name='Shahid sir')) temp where teacher.te_id = temp.te_id;
			

			select r.marks from results r, (select st_id from student where dept='bba') bbast where r.st_id = bbast.st_id;
			MARKS
			----------
			 86
			100
			 97
	
			select avg(r.marks) from results r, (select st_id from student where dept='bba') bbast where r.st_id = bbast.st_id;
			AVG(R.MARKS)
			------------
			94.3333333
    
			select crs_id, avg(marks) from results group by crs_id having crs_id>=1002;  //= kuddus
			CRS_ID 		AVG(MARKS)
			---------- ----------
			1002 		86.6666667
			1007 		94.3333333
	  	  
			select c.crs_title, crsveiw.avgMarks from course c, (select crs_id, avg(marks) avgMarks from results group by crs_id having crs_id>=1002) crsveiw where crsveiw.crs_id=c.crs_id;
			CRS_TITLE                                            AVGMARKS
			-------------------------------------------------- ----------
			c lab                                                      90
			principles of economics                            94.3333333
	
	
			select kuddus.crs_id, crs_title, kuddus.avgMarks from course c, (select crs_id, avg(marks) avgMarks from results group by crs_id having crs_id>=1002) kuddus where c.crs_id=kuddus.crs_id;	
			CRS_ID 		CRS_TITLE                      AVGMARKS
			---------- ------------------------------- ----------
			1002 		c lab                          86.6666667
			1007 		principles of economics        94.3333333

	
			select crs_title, kuddus.avgMarks from course c, (select crs_id, avg(marks) avgMarks from results group by crs_id having crs_id>=1002) kuddus where c.crs_id=kuddus.crs_id;					
			CRS_TITLE                                          AVGMARKS
			-------------------------------------------------- ----------
			c lab                                              86.6666667
			principles of economics                            94.3333333
	
			select avg(r.marks) from results r where r.te_id = (select te_id from teacher where te_name='Shahid sir');
			AVG(R.MARKS)
			------------
			86.6666667
  
select avg(r.marks) from results r where r.te_id = (select te_id from teacher where te_name='Shahid sir');
************************************************ INTRODUCTION ************************************************

create user university identified by 1;

grant connect, resource to university;

CLEAR SCREEN: cl scr;



************************************************ TABLE CREATION ************************************************

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
		
		
		create table demo(
			st_id integer,
			detail varchar2(30)
		);
		
		drop 
		
		ALTER TABLE demo ADD CONSTRAINT demo_st_id st_id references student(st_id) on delete cascade;
		
		ALTER TABLE demo drop column st_id;
		ALTER TABLE demo ADD CONSTRAINT demo st_id references student(st_id);
		
		
		
		29/04-> Tutorial(12.00 PM)
		
		18/04-> Lab Exam (05.00PM)
		
		02/05-> Presentation (11.00AM)
		
	
01679 065930 

		
************************************************ INSERT INTO TABLE ************************************************

		###GENERAL APPROACH:		
			insert into
			student(st_id, st_name, dept, ssn)
			values(14031002, 'sorna', 'bba', 7);
		

		###SHORTCUT APPROACH (STUDENT):	
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

			
		###SHORTCUT APPROACH (TEACHER):
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
		
		
		###SHORTCUT APPROACH (COURSE):
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
		
		###SHORTCUT APPROACH (RESULTS):
			
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
			
			bba....
				insert into results
				values(14021001, 202, 1007, 97);
				insert into results
				values(14021002, 202, 1007, 86);
				insert into results
				values(14031001, 202, 1007, 100);

				
				
************************************************ DELETE FROM TABLE ************************************************
		
		delete from results where crs_id=1007;
	
	
	
	
************************************************ SELECT QUERY ************************************************
	
	
					########################## GENERAL ##########################
	
			select st_id, dept from student; 
		    ST_ID 		DEPT
			---------- 	-----
			14020002 	cse
			14020003 	cse
			14020004 	cse
			14020005 	cse
			14030001 	cse
			14030003 	cse
			14021001 	bba
			14021002 	bba
			14031001 	bba
			14031002 	bba
			
			
			select st_id, dept from student order by address;
			ST_ID 		DEPT
			---------- -----
			14021001 	bba
			14020005 	cse
			14031001 	bba
			14021002 	bba
			14030001 	cse
			14030003 	cse
			14020003 	cse
			14020004 	cse
			14020002 	cse
			14031002 	bba

			
			select st_name, address from student where dept='cse';
			ST_NAME				ADDRESS
			------------		------------
			raihan				sylhet
			smriti				komilla
			pranto				netrokuna
			topu				bissonat
			sirat				hetimgong
			tasnim				hetimgong
	
	
			select st_name, address from student where dept='bba';
			ST_NAME				ADDRESS
			------------		------------
			kuddus				Sylhet
			mokles				dhaka
			rahima				dhaka
			sorna
		
		
			select crs_code, crs_title, credit from course order by crs_title;
			CRS_CODE 		CRS_TITLE                            CREDIT
			-------- 		-------------------------------     -------
			cse 231  		algorithm                                 3
			cse 232  		algorithm lab                           1.5
			cse 113  		c                                         3
			cse 114  		c lab                                   1.5
			cse 131  		data structure                            3
			cse 132  		data structure lab                      1.5
			bba 102  		principles of accounting                  3
			bba 101  		principles of economics                   3

		
		
		
		
					########################## JOIN ##########################
			
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

			select s.st_name, r.marks from student s, results r where s.st_id=r.st_id and r.marks>=90;
			ST_NAME                             MARKS
			-------- 						  --------
			raihan                                 90
			smriti                                100
			smriti                                 95
			kuddus                                 97
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
	
			select s.st_name, t.te_name, c.crs_title, r.marks from student s, teacher t, course c, results r where s.st_id=r.st_id and t.te_id=r.te_id and c.crs_id=r.crs_id;
			ST_NAME			TE_NAME			CRS_TITLE					MARKS
			---------- 		------------	--------------------		----------
			raihan          Shahid sir		c lab                       85
			raihan          Shahid sir		c                           90
			smriti          Shahid sir		c lab                       95
			smriti          Shahid sir		c                           100
			kuddus          manni mam		principles of economics     97
			mokles         	manni mam		principles of economics     86
			rahima          manni mam		principles of economics     100
		
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

			
					########################## AGGREATION ##########################	

				select count(st_id) from student;
				COUNT(ST_ID)
				------------
						  10
						  
				select count(dept) from student;
				COUNT(DEPT)
				-----------
						 10			 
				
				select count(distinct dept) from student;
				COUNT(DISTINCTDEPT)
				-------------------
								  2
				
				select max(marks) from results;
				MAX(MARKS)
				----------
					   100
				
				select min(marks) from results;
				MIN(MARKS)
				----------
						85						
						
				select avg(marks) from results;
				AVG(MARKS)
				----------
				93.2857143
							
				select st_id, marks from results where crs_id=1002;
				ST_ID      			MARKS
				---------- 			------
				14020002         	85
				14020003         	95	
								
				select sum(marks) from results where crs_id=1002;
				SUM(MARKS)
				----------
					   180
				
				select avg(marks) from results where crs_id=1002;
				AVG(MARKS)
				----------
						90

						
						
					########################## GROUP BY ##########################						

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
					
				select crs_id, sum(marks) from results group by crs_id;
				CRS_ID 		SUM(MARKS)
				---------- 	----------
				1001        190
				1002        180
				1007        283
								
				select st_id, sum(marks) from results group by st_id;
				ST_ID 		SUM(MARKS)
				---------- ----------
				14020002        175
				14020003        195
				14021001         97
				14021002         86
				14031001        100
				
				select st_id, sum(marks) from results group by st_id having st_id>=14020003;
				ST_ID 				SUM(MARKS)
				---------- 			----------
				14020003        	195
				14021001         	97
				14021002         	86
				14031001        	100
				
				select st_id, avg(marks) from results group by st_id having avg(marks)>90;
				ST_ID 		AVG(MARKS)
				---------- ----------
				14020003       	97.5
				14021001          97
				14031001         100
				

					########################## AGGREATION with JOINING ##########################				

				select avg(marks) from results;
				AVG(MARKS)
				----------
				93.2857143
		
				select s.st_id, s.st_name, r.marks from student s, course c, results r where s.st_id=r.st_id and c.crs_id=r.crs_id and c.crs_code='bba 101' and r.marks>79;
				ST_ID 			ST_NAME            	    MARKS
				---------- 		------------------ ----------
				14021001 		kuddus                     97
				14021002 		mokles                     86
				14031001 		rahima                    100
	
				select count(st_id) from course c, results r where c.crs_id=r.crs_id and c.crs_code='bba 101' and r.marks>=90;
				COUNT(ST_ID)
				------------
						   2
		
					########################## USING LIKE ##########################
				
				
				
				select st_name from student where st_name like 's%';
				ST_NAME
				---------
				smriti
				sirat
				sorna
				
				select te_name, address from teacher where te_name like '_____d%';
				TE_NAME				ADDRESS
				------------		------------
				Shahid sir			maymansing
				khaled sir			moulvibazar
				
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

		
		
					########################## USING IN ##########################

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

				
					########################## USING BETWEEN ##########################

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
			
			
					########################## REPLACING NULL VALUE ##########################

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


					########################## CONCATANATION ##########################

				select frist_name||' '||last_name as "teacher_name" from teacher;
				
				
				select address||'-'||phone as "contact" from student;

				
				

				########################## SUB QUERY ##########################


			select c.crs_title, veiwt.avgMarks  from course c, (select crs_id, avg(marks) avgMarks from results group by crs_id) veiwt where c.crs_id=veiwt.crs_id;


			select avg(marks) from results where crs_id=(select crs_id from course where crs_title= 'c lab');
			AVG(MARKS)
			----------
					90
						

			select demo1.st_name, r.marks from results r, (select s.st_id, s.st_name from student s, (select st_id from results where marks=(select min(marks) from results) ) demo where s.st_id=demo.st_id) demo1 where demo1.st_id=r.st_id;

						
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
	
	
		
		
************************************************ UPDATE ************************************************

		
		update course
			set crs_code = 'cse 113'
			where crs_id = 1001;	
			
			
		UPDATE student 
			set address = 'Comilla'
			where st_id=14020003;
			
		UPDATE student 
			set address = 'Comilla'
			where st_id=(select st_id from student st_name='smriti');
			
			
		update student
			set address = 'sylhet'
			where st_id = (select st_id from student where st_name like 'k%s');
			
		
					########################## ALTER TABLE ##########################		
			
			ADDING NEW COLUMN:			
				ALTER TABLE student add email varchar2(30) not null;
			
			ADDING SYSTEM_DATE IN A NEW COLUMN:
				ALTER TABLE student ADD dateColumn date default SYSDATE not null;
				
			DROP A COLUMN:
				ALTER TABLE student DROP COLUMN email;
				
			ADDING CONSRAINT:
				ALTER TABLE student MODIFY address constraint st_nn1 not null;
				
				ALTER TABLE student ADD CONSTRAINT st_ph UNIQUE(Phone);
				
				ALTER TABLE results DROP COLUMN st_id;
				
				//ALTER TABLE results ADD CONSTRAINT re_2 st_id references student(st_id);
				
				//ALTER TABLE results ADD CONSTRAINT re_2 st_id references student(st_id) on delete casecade;
				
				//ALTER TABLE results DROP CONSTRAINT re_st_id_fk;
				
				
				
			MODIFY TABLE NAME:
				RENAME old to new;
			
			ALL DELETE:
				TRUNCATE TABLE student;
				
			CREATING SEQUENCE:
				create sequence cr_sq_Pk  NOCACHE;
				insert into course values (cr_sq_Pk.nextval, 'CSE 425', 'Web Engineering', 3.00);
				
				
			CREATING VIEW:
				CREATE VIEW student_veiw AS select st_id, st_name from student; 
				
				
				
		....CHANGE A Column_Size:
			alter table course modify crs_code varchar2(8);

			
			
			
			
import data: @ directory\fileName.sql
			 @ C:\Users\HP-Stream\Desktop\New' 'Text' 'Document.sql
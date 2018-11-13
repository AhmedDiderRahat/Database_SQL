 ANSWER: 1

		 create user shop identified by computer;
		  
		 grant connect, resource to shop;
		 
		@ C:\Users\HP-Stream\Desktop\exam\shopSwapno.sql;
		
		select name from product order by name;
			NAME
			---------------
			car
			fish
			football
			mango
			panjabi
			plane
			rice
			sharee
			shirt
			
			
			
ANSWER: 2

	select DISTINCT prdate from purchase;
	PRDATE
	---------
	01-JAN-16
	01-MAR-16
	01-FEB-16

	
	
ANSWER: 3
		select count(voterId) from customer where address='sylhet';
		COUNT(VOTERID)
		--------------
					 3

					 
ANSWER 4:

		select DISTINCT first_name from customer c, purchase p, product prd where c.voterId=p.voterId and prd.pr_id=p.pr_id and prd.price<50 order by first_name;

		FIRST_NAME
		---------------
		jodu
		karim
		modhu
		rahim

		
ANSWER 5:
		select count(purchase_id) from purchase;
		
		COUNT(PURCHASE_ID)
		------------------
						 8

						 
ANSWER 6:
						 
		select name from product where price>(select avg(price) from product);

		NAME
		---------------
		sharee
		car
		plane
		football
		
		
		
ANSWER 7:
		
			
		select prd.name, demo.ans /from product prd,(select pr_id, sum(price) ans from (select p.pr_id, price from product prd, purchase p where p.pr_id=prd.pr_id) group by pr_id) demo where demo.pr_id=prd.pr_id;

		NAME                   ANS
		--------------- ----------
		rice                    40
		fish                   120
		shirt                   80
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	select sum(price) from (select p.pr_id, prd.name, prd.price from product prd, purchase p where p.pr_id=prd.pr_id) ;  
		
	
    select sum(price) f  select p.pr_id, price from product prd, purchase p where p.pr_id=prd.pr_id;	
              
			  
	(select pr_id, sum(price) from (select p.pr_id, price from product prd, purchase p where p.pr_id=prd.pr_id) group by pr_id) ;	


	select prd.name, demo.ans from product prd,(select pr_id, sum(price) ans from (select p.pr_id, price from product prd, purchase p where p.pr_id=prd.pr_id) group by pr_id) demo where demo.pr_id=prd.pr_id;	
		
	
		
	select prd_id, sum() from purchase group by prd_id;
		
		
		
		
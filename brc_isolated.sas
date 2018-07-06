
/* 
	Bridged Race Categories isolated

	Includes:
	- Non-Hispanic White Male and Female
	- Non-Hispanic or Hispanic AI/AN Male and Female
*/;

data brc_2010_2017;
	set 'C:\Users\andrews\Local\pcen_v2017_y1017.sas7bdat';
run;

proc SQL;
	CREATE TABLE WORK.brc_isolated_2010_2017 AS
	SELECT * FROM WORK.brc_2010_2017
		WHERE  ( hisp = 1 AND RACESEX = 1 ) 
			OR ( hisp = 1 AND RACESEX = 2 )
			OR (( hisp = 1 OR hisp = 2 ) AND RACESEX = 5 )
			OR (( hisp = 1 OR hisp = 2 ) AND RACESEX = 6 );
QUIT;

/* export to thew big three: csv, dta, sas7bdat */;

PROC EXPORT DATA= WORK.brc_isolated_2010_2017 
            OUTFILE= "C:\Users\andrews\Local\brc_isolated_2010_2017.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

PROC EXPORT DATA= WORK.brc_isolated_2010_2017 
            OUTFILE= "C:\Users\andrews\Local\brc_isolated_2010_2017.dta" 
            DBMS=STATA REPLACE;
RUN;

Libname out 'c:\Users\andrews\Local';
data out.brc_isolated_2010_2017;
	set Work.brc_isolated_2010_2017;
run;

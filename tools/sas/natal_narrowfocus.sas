data natal;
	set 'C:\Users\andrews\Local\bigdat.sas7bdat';
run;

proc SQL;
	CREATE TABLE WORK.natal_narrowfield AS
	SELECT mracerec,
		umhisp,
		mager9,
		cig_rec,
		fipsrec,
		ocntyfips,
		ostate,
		ostaterec,
		staterec
		FROM WORK.natal;
QUIT;

proc SQL;
	CREATE TABLE WORK.natal_narrowfield_countyisolated AS
	SELECT * FROM WORK.natal_narrowfield
		WHERE
		 ostate = 'CA' AND ocntyfips = 1 OR
		 ostate = 'CA' AND ocntyfips = 13 OR
		 ostate = 'CA' AND ocntyfips = 19 OR
		 ostate = 'CA' AND ocntyfips = 29 OR
		 ostate = 'CA' AND ocntyfips = 37 OR
		 ostate = 'CA' AND ocntyfips = 39 OR
		 ostate = 'CA' AND ocntyfips = 41 OR
		 ostate = 'CA' AND ocntyfips = 67 OR
		 ostate = 'CA' AND ocntyfips = 73 OR
		 ostate = 'CA' AND ocntyfips = 75 OR
		 ostate = 'CA' AND ocntyfips = 79 OR
		 ostate = 'CA' AND ocntyfips = 81 OR
		 ostate = 'CA' AND ocntyfips = 83 OR
		 ostate = 'CA' AND ocntyfips = 85 OR
		 ostate = 'CA' AND ocntyfips = 107 OR
		 ostate = 'CA' AND ocntyfips = 111;
QUIT;

Libname out 'c:\Users\andrews\Local';
data out.natal_narrowfield_countyisolated;
	set Work.natal_narrowfield_countyisolated;
run; 

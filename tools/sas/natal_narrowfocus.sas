data natal;
	set "C:\Users\andrews\Local\_08to12_DENOM_allUS_Copy.sas7bdat";
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
		WHERE ocntyfips = 35
			OR ocntyfips = 153
			OR ocntyfips = 3
			OR ocntyfips = 5
			OR ocntyfips = 13
			OR ocntyfips = 27
			OR ocntyfips = 33
			OR ocntyfips = 3
			OR ocntyfips = 111
			OR ocntyfips = 15
			OR ocntyfips = 59
			OR ocntyfips = 29
			OR ocntyfips = 63
			OR ocntyfips = 37
			OR ocntyfips = 47
			OR ocntyfips = 95
			OR ocntyfips = 165
			OR ocntyfips = 97
			OR ocntyfips = 5
			OR ocntyfips = 47
			OR ocntyfips = 61
			OR ocntyfips = 81
			OR ocntyfips = 85
			OR ocntyfips = 17
			OR ocntyfips = 27
			OR ocntyfips = 125
			OR ocntyfips = 189
			OR ocntyfips = 29
			OR ocntyfips = 143;
QUIT;

Libname out 'c:\Users\andrews\Local';
data out.natal_narrowfield_countyisolated;
	set Work.natal_narrowfield_countyisolated;
run; 

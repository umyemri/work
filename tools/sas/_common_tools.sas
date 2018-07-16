

/*--------------*
| export macros |
|
|- global variables
*/;
%LET working_data= WORK.heights;
%LET working_folder= C:\Users\andrews\Local;
%LET name_data = heights;

%MACRO export_three;
	/* export to the big three: csv, dta, sas7bdat 

	csv: there a reason for that double period... only works if it's there...*/;
	PROC EXPORT DATA= &working_data
			OUTFILE= "&working_folder\&name_data..csv" 
			DBMS=CSV REPLACE;
		 PUTNAMES=YES;
	RUN;

	/* dta */;
	PROC EXPORT DATA= &working_data
			OUTFILE= "&working_folder\&name_data.dta" 
			DBMS=STATA REPLACE;
	RUN;

	/* sas7bdat */;
	Libname out "&working_folder\";
	data out.&name_data;
		set &working_data;
	run;
%MEND export_three;



/*----------------*
| importer macros | 
|
| - csv */;
%macro importcsv(file);
   proc import 
      datafile="%superq(file)" 
      out=%scan(&file,-2,.\) replace;
   run;
%mend importcsv;

/*- stata: dta */;
%macro importdta(file);
	proc import
	  datafile="%superq(file)"
	  dbms=DTA replace;
	run;
%mend importdta;

/*- sas7bdat */;
data name_for_lib;
	set "&working_folder";
run;

/* uncommment to use */;
* %export_three;
* %importcsv(C:\Users\andrews\Local\LaurensData_Revised.csv)
* %importdta(C:\Users\andrews\Local\LaurensData_Revised.dta)



/*--------------------------------*
| explorers: investigate datasets |
*---------------------------------*/;

/* data reports */;
proc contents data= WORK.____; run;

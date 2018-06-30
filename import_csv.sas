%macro importcsv(file);
   proc import 
      datafile="%superq(file)" 
      out=%scan(&file,-2,.\) replace;
   run;
%mend importcsv;

%importcsv(C:\Users\andrews\Local\LaurensData_Revised.csv)

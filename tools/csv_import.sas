/*
no export function needed, as sas 9.4 comes with an easy export wizard 
again [] bracket are not needed, just to bring attention to the namespace.
*/;

#clearly stolen code with some modifications;
%macro importcsv(file);
   proc import 
      datafile="%superq(file)" 
      out=%scan(&file,-2,.\) replace;
   run;
%mend importcsv;

%importcsv([location of your csv file])

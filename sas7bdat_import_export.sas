/* note: [] <- brackets not needed, just an indication of name space */;

#import;
data [name of dataset you want];
	set '[sas7bdat file location]';
run;


#export;
Libname out '[location you want to save to]';

data out.[name of data to export];
	set Work.[name of data to export];
run; 

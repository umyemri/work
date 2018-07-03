# import
data name_of_dataset_you_want;
	set '[sas7bdat file location]';
run;


# export
Libname out '[location you want to save to]';

data out.name_of_data_to_export;
	set Work.name_of_data_to_export;
run; 

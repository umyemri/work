/* used to do a sql query of a dataset in sas 9.4 */
proc SQL;
	CREATE TABLE WORK.[name of new table you want to create] AS
		

	FROM WORK.[name of data set working from];
QUIT;

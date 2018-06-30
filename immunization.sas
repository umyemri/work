%macro importcsv(file);
   proc import 
      datafile="%superq(file)" 
      out=%scan(&file,-2,.\) replace;
   run;
%mend importcsv;

%importcsv(C:\Users\andrews\Local\LaurensData_Revised.csv)

DATA Laurensdata_revised;
	set Laurensdata_revised;
	if race = "NA" then race = 9;
	if ethnicity = "NA" then ethnicity = 3;
	if dtap_dt_td_VAX_COUNT = "NA" then dtap_dt_td_VAX_COUNT = 0;
	if flu_VAX_COUNT = "NA" then flu_VAX_COUNT = 0;
	if h1n1_09_VAX_COUNT = "NA" then h1n1_09_VAX_COUNT = 0;
	if hep_a_VAX_COUNT = "NA" then hep_a_VAX_COUNT = 0;
	if hep_b_2_do_VAX_COUNT = "NA" then hep_b_2_do_VAX_COUNT = 0;
	if hep_b_3_do_VAX_COUNT = "NA" then hep_b_3_do_VAX_COUNT = 0;
	if herpes_zo_VAX_COUNT = "NA" then herpes_zo_VAX_COUNT = 0;
	if hib_VAX_COUNT = "NA" then hib_VAX_COUNT = 0;
	if hpv_VAX_COUNT = "NA" then hpv_VAX_COUNT = 0;
	if measles_VAX_COUNT = "NA" then measles_VAX_COUNT = 0;
	if meningo_b_om_VAX_COUNT = "NA" then meningo_b_om_VAX_COUNT = 0;
	if meningo_b_re_VAX_COUNT = "NA" then meningo_b_re_VAX_COUNT = 0;
	if meningo_VAX_COUNT = "NA" then meningo_VAX_COUNT = 0;
	if mmr_VAX_COUNT = "NA" then mmr_VAX_COUNT = 0;
	if mumps_VAX_COUNT = "NA" then mumps_VAX_COUNT = 0;
	if noname_VAX_COUNT = "NA" then noname_VAX_COUNT = 0;
	if pneumo_pcv_VAX_COUNT = "NA" then pneumo_pcv_VAX_COUNT = 0;
	if pneumo_ppsv_VAX_COUNT = "NA" then pneumo_ppsv_VAX_COUNT = 0;
	if polio_VAX_COUNT = "NA" then polio_VAX_COUNT = 0;
	if rotavirus_VAX_COUNT = "NA" then rotavirus_VAX_COUNT = 0;
	if rubella_VAX_COUNT = "NA" then rubella_VAX_COUNT = 0;
	if small_shre_VAX_COUNT = "NA" then small_shre_VAX_COUNT = 0;
	if tdap_VAX_COUNT = "NA" then tdap_VAX_COUNT = 0;
	if varicella_VAX_COUNT = "NA" then varicella_VAX_COUNT = 0;
run;

DATA Laurensdata_revised;
	set Laurensdata_revised(
		rename=race=race_old
		rename=ethnicity=ethnicity_old
		rename=dtap_dt_td_VAX_COUNT=dtap_old
		rename=flu_VAX_COUNT=flu_old
		rename=h1n1_09_VAX_COUNT=h1n1_old
		rename=hep_a_VAX_COUNT=hepa_old
		rename=hep_b_2_do_VAX_COUNT=hepb2_old
		rename=hep_b_3_do_VAX_COUNT=hepb3_old
		rename=herpes_zo_VAX_COUNT=herpes_old
		rename=hib_VAX_COUNT=hib_old
		rename=hpv_VAX_COUNT=hpv_old
		rename=measles_VAX_COUNT=meas_old
		rename=meningo_b_om_VAX_COUNT=meningo1_old
		rename=meningo_b_re_VAX_COUNT=meningo2_old
		rename=meningo_VAX_COUNT=meningo0_old
		rename=mmr_VAX_COUNT=mmr_old
		rename=mumps_VAX_COUNT=mumps_old
		rename=noname_VAX_COUNT=noname_old
		rename=pneumo_pcv_VAX_COUNT=pneumo0_old
		rename=pneumo_ppsv_VAX_COUNT=pneumo1_old
		rename=polio_VAX_COUNT=polio_old
		rename=rotavirus_VAX_COUNT=rota_old
		rename=rubella_VAX_COUNT=rube_old
		rename=small_shre_VAX_COUNT=small_old
		rename=tdap_VAX_COUNT=tdap_old
		rename=varicella_VAX_COUNT=vari_old
		);
	race = input(race_old, best12.);
	ethnicity = input(ethnicity_old, best12.);
	dtap_dt_td_VAX_COUNT = input(dtap_old, best12.);
	flu_VAX_COUNT = input(flu_old, best12.);
	h1n1_09_VAX_COUNT = input(h1n1_old, best12.);
	hep_a_VAX_COUNT = input(hepa_old, best12.);
	hep_b_2_do_VAX_COUNT = input(hepb2_old, best12.);
	hep_b_3_do_VAX_COUNT = input(hepb3_old, best12.);
	herpes_zo_VAX_COUNT = input(herpes_old, best12.);
	hib_VAX_COUNT = input(hib_old, best12.);
	hpv_VAX_COUNT = input(hpv_old, best12.);
	measles_VAX_COUNT = input(meas_old, best12.);
	meningo_b_om_VAX_COUNT = input(meningo1_old, best12.);
	meningo_b_re_VAX_COUNT = input(meningo2_old, best12.);
	meningo_VAX_COUNT = input(meningo0_old, best12.);
	mmr_VAX_COUNT = input(mmr_old, best12.);
	mumps_VAX_COUNT = input(mumps_old, best12.);
	noname_VAX_COUNT = input(noname_old, best12.);
	pneumo_pcv_VAX_COUNT = input(pneumo0_old, best12.);
	pneumo_ppsv_VAX_COUNT = input(pneumo1_old, best12.);
	polio_VAX_COUNT = input(polio_old, best12.);
	rotavirus_VAX_COUNT = input(rota_old, best12.);
	rubella_VAX_COUNT = input(rube_old, best12.);
	small_shre_VAX_COUNT = input(small_old, best12.);
	tdap_VAX_COUNT = input(tdap_old, best12.);
	varicella_VAX_COUNT = input(vari_old, best12.);
	drop race_old;
	drop ethnicity_old;
	drop dtap_old;
	drop flu_old;
	drop h1n1_old;
	drop hepa_old;
	drop hepb2_old;
	drop hepb3_old;
	drop herpes_old;
	drop hib_old;
	drop hpv_old;
	drop meas_old;
	drop meningo1_old;
	drop meningo2_old;
	drop meningo0_old;
	drop mmr_old;
	drop mumps_old;
	drop noname_old;
	drop pneumo0_old;
	drop pneumo1_old;
	drop polio_old;
	drop rota_old;
	drop rube_old;
	drop small_old;
	drop tdap_old;
	drop vari_old;
	drop VAR160;
run;

proc SQL;
	CREATE TABLE WORK.LDATA_R AS
		SELECT ASIIS_PAT_ID, birthdate, gender, race, ethnicity, city, state, zip, AnyContra,
			anthrax_AgeAtLastVax, anthrax_LAST_DOSE_DATE, anthrax_VAX_COUNT, anthrax_FACILITY_NAME, anthrax_ORGANIZATION_NAME, anthrax_cnty,
			dtap_dt_td_AgeAtLastVax, dtap_dt_td_LAST_DOSE_DATE, dtap_dt_td_VAX_COUNT, dtap_dt_td_FACILITY_NAME, dtap_dt_td_ORGANIZATION_NAME, dtap_dt_td_cnty,
			flu_AgeAtLastVax, flu_LAST_DOSE_DATE, flu_VAX_COUNT, flu_FACILITY_NAME, flu_ORGANIZATION_NAME, flu_cnty,
			h1n1_09_AgeAtLastVax, h1n1_09_LAST_DOSE_DATE, h1n1_09_VAX_COUNT, h1n1_09_FACILITY_NAME, h1n1_09_ORGANIZATION_NAME, h1n1_09_cnty,
			hep_a_AgeAtLastVax, hep_a_LAST_DOSE_DATE, hep_a_VAX_COUNT, hep_a_FACILITY_NAME, hep_a_ORGANIZATION_NAME, hep_a_cnty,
			hep_b_2_do_AgeAtLastVax, hep_b_2_do_LAST_DOSE_DATE, hep_b_2_do_VAX_COUNT, hep_b_2_do_FACILITY_NAME, hep_b_2_do_ORGANIZATION_NAME, hep_b_2_do_cnty,
			hep_b_3_do_AgeAtLastVax, hep_b_3_do_LAST_DOSE_DATE, hep_b_3_do_VAX_COUNT, hep_b_3_do_FACILITY_NAME, hep_b_3_do_ORGANIZATION_NAME, hep_b_3_do_cnty,
			herpes_zo_AgeAtLastVax, herpes_zo_LAST_DOSE_DATE, herpes_zo_VAX_COUNT, herpes_zo_FACILITY_NAME, herpes_zo_ORGANIZATION_NAME, herpes_zo_cnty,
			hib_AgeAtLastVax, hib_LAST_DOSE_DATE, hib_VAX_COUNT, hib_FACILITY_NAME, hib_ORGANIZATION_NAME, hib_cnty,
			hpv_AgeAtLastVax, hpv_LAST_DOSE_DATE, hpv_VAX_COUNT, hpv_FACILITY_NAME, hpv_ORGANIZATION_NAME, hpv_cnty,
			measles_AgeAtLastVax, measles_LAST_DOSE_DATE, measles_VAX_COUNT, measles_FACILITY_NAME, measles_ORGANIZATION_NAME, measles_cnty,
			meningo_b_om_AgeAtLastVax, meningo_b_om_LAST_DOSE_DATE, meningo_b_om_VAX_COUNT, meningo_b_om_FACILITY_NAME, meningo_b_om_ORGANIZATION_NAME, meningo_b_om_cnty,
			meningo_b_re_AgeAtLastVax, meningo_b_re_LAST_DOSE_DATE, meningo_b_re_VAX_COUNT, meningo_b_re_FACILITY_NAME, meningo_b_re_ORGANIZATION_NAME, meningo_b_re_cnty,
			meningo_AgeAtLastVax, meningo_LAST_DOSE_DATE, meningo_VAX_COUNT, meningo_FACILITY_NAME, meningo_ORGANIZATION_NAME, meningo_cnty,
			mmr_AgeAtLastVax, mmr_LAST_DOSE_DATE, mmr_VAX_COUNT, mmr_FACILITY_NAME, mmr_ORGANIZATION_NAME, mmr_cnty,
			mumps_AgeAtLastVax, mumps_LAST_DOSE_DATE, mumps_VAX_COUNT, mumps_FACILITY_NAME, mumps_ORGANIZATION_NAME, mumps_cnty,
			noname_AgeAtLastVax, noname_LAST_DOSE_DATE, noname_VAX_COUNT, noname_FACILITY_NAME, noname_ORGANIZATION_NAME, noname_cnty,
			pneumo_pcv_AgeAtLastVax, pneumo_pcv_LAST_DOSE_DATE, pneumo_pcv_VAX_COUNT, pneumo_pcv_FACILITY_NAME, pneumo_pcv_ORGANIZATION_NAME, pneumo_pcv_cnty,
			pneumo_ppsv_AgeAtLastVax, pneumo_ppsv_LAST_DOSE_DATE, pneumo_ppsv_VAX_COUNT, pneumo_ppsv_FACILITY_NAME, pneumo_ppsv_ORGANIZATION_NAME, pneumo_ppsv_cnty,
			polio_AgeAtLastVax, polio_LAST_DOSE_DATE, polio_VAX_COUNT, polio_FACILITY_NAME, polio_ORGANIZATION_NAME, polio_cnty,
			rotavirus_AgeAtLastVax, rotavirus_LAST_DOSE_DATE, rotavirus_VAX_COUNT, rotavirus_FACILITY_NAME, rotavirus_ORGANIZATION_NAME, rotavirus_cnty,
			rubella_AgeAtLastVax, rubella_LAST_DOSE_DATE, rubella_VAX_COUNT, rubella_FACILITY_NAME, rubella_ORGANIZATION_NAME, rubella_cnty,
			small_shre_AgeAtLastVax, small_shre_LAST_DOSE_DATE, small_shre_VAX_COUNT, small_shre_FACILITY_NAME, small_shre_ORGANIZATION_NAME, small_shre_cnty,
			tdap_AgeAtLastVax, tdap_LAST_DOSE_DATE, tdap_VAX_COUNT, tdap_FACILITY_NAME, tdap_ORGANIZATION_NAME, tdap_cnty,
			varicella_AgeAtLastVax, varicella_LAST_DOSE_DATE, varicella_VAX_COUNT, varicella_FACILITY_NAME, varicella_ORGANIZATION_NAME, varicella_cnty
				FROM WORK.LAURENSDATA_REVISED;
QUIT;

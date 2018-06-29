# immunization.R
# 
# by: Andrew Sikes
# created: 06/22/2018
# modified: everyday...
# 
# purpose: 
#   data clean up, consolidate rows for each ASIIS_PAT_ID in LaurensData.dta. 
# VAX_Count needs to be MMR_VAX_Count, HEPC_VAX_Count, etc. creates some 159
# different variables, but should reduce the row count dramatically.
#

# import dta with haven lib - global dataset
library(haven)
LaurensData <- read_dta("C:/Users/andrews/Local/LaurensData.dta")

new_df <- data.frame( 
  'ASIIS_PAT_ID'= '',
  'birthdate'= '',
  'gender'= '',
  'race'= '',
  'ethnicity'= '',
  'city'= '',
  'state'= '',
  'zip'= '',
  'anthrax_AgeAtLastVax'= '',
  'anthrax_FACILITY_NAME'= '',
  'anthrax_LAST_DOSE_DATE'= '',
  'anthrax_ORGANIZATION_NAME'= '',
  'anthrax_VAX_COUNT'= '',
  'anthrax_cnty'= '',
  'dtap_dt_td_AgeAtLastVax'= '',
  'dtap_dt_td_FACILITY_NAME'= '',
  'dtap_dt_td_LAST_DOSE_DATE'= '',
  'dtap_dt_td_ORGANIZATION_NAME'= '',
  'dtap_dt_td_VAX_COUNT'= '',
  'dtap_dt_td_cnty'= '',
  'flu_AgeAtLastVax'= '',
  'flu_FACILITY_NAME'= '',
  'flu_LAST_DOSE_DATE'= '',
  'flu_ORGANIZATION_NAME'= '',
  'flu_VAX_COUNT'= '',
  'flu_cnty'= '',
  'h1n1_09_AgeAtLastVax'= '',
  'h1n1_09_FACILITY_NAME'= '',
  'h1n1_09_LAST_DOSE_DATE'= '',
  'h1n1_09_ORGANIZATION_NAME'= '',
  'h1n1_09_VAX_COUNT'= '',
  'h1n1_09_cnty'= '',
  'hep_a_AgeAtLastVax'= '',
  'hep_a_FACILITY_NAME'= '',
  'hep_a_LAST_DOSE_DATE'= '',
  'hep_a_ORGANIZATION_NAME'= '',
  'hep_a_VAX_COUNT'= '',
  'hep_a_cnty'= '',
  'hep_b_2_do_AgeAtLastVax'= '',
  'hep_b_2_do_FACILITY_NAME'= '',
  'hep_b_2_do_LAST_DOSE_DATE'= '',
  'hep_b_2_do_ORGANIZATION_NAME'= '',
  'hep_b_2_do_VAX_COUNT'= '',
  'hep_b_2_do_cnty'= '',
  'hep_b_3_do_AgeAtLastVax'= '',
  'hep_b_3_do_FACILITY_NAME'= '',
  'hep_b_3_do_LAST_DOSE_DATE'= '',
  'hep_b_3_do_ORGANIZATION_NAME'= '',
  'hep_b_3_do_VAX_COUNT'= '',
  'hep_b_3_do_cnty'= '',
  'herpes_zo_AgeAtLastVax'= '',
  'herpes_zo_FACILITY_NAME'= '',
  'herpes_zo_LAST_DOSE_DATE'= '',
  'herpes_zo_ORGANIZATION_NAME'= '',
  'herpes_zo_VAX_COUNT'= '',
  'herpes_zo_cnty'= '',
  'hib_AgeAtLastVax'= '',
  'hib_FACILITY_NAME'= '',
  'hib_LAST_DOSE_DATE'= '',
  'hib_ORGANIZATION_NAME'= '',
  'hib_VAX_COUNT'= '',
  'hib_cnty'= '',
  'hpv_AgeAtLastVax'= '',
  'hpv_FACILITY_NAME'= '',
  'hpv_LAST_DOSE_DATE'= '',
  'hpv_ORGANIZATION_NAME'= '',
  'hpv_VAX_COUNT'= '',
  'hpv_cnty'= '',
  'measles_AgeAtLastVax'= '',
  'measles_FACILITY_NAME'= '',
  'measles_LAST_DOSE_DATE'= '',
  'measles_ORGANIZATION_NAME'= '',
  'measles_VAX_COUNT'= '',
  'measles_cnty'= '',
  'meningo_b_om_AgeAtLastVax'= '',
  'meningo_b_om_FACILITY_NAME'= '',
  'meningo_b_om_LAST_DOSE_DATE'= '',
  'meningo_b_om_ORGANIZATION_NAME'= '',
  'meningo_b_om_VAX_COUNT'= '',
  'meningo_b_om_cnty'= '',
  'meningo_b_re_AgeAtLastVax'= '',
  'meningo_b_re_FACILITY_NAME'= '',
  'meningo_b_re_LAST_DOSE_DATE'= '',
  'meningo_b_re_ORGANIZATION_NAME'= '',
  'meningo_b_re_VAX_COUNT'= '',
  'meningo_b_re_cnty'= '',
  'meningo_AgeAtLastVax'= '',
  'meningo_FACILITY_NAME'= '',
  'meningo_LAST_DOSE_DATE'= '',
  'meningo_ORGANIZATION_NAME'= '',
  'meningo_VAX_COUNT'= '',
  'meningo_cnty'= '',
  'mmr_AgeAtLastVax'= '',
  'mmr_FACILITY_NAME'= '',
  'mmr_LAST_DOSE_DATE'= '',
  'mmr_ORGANIZATION_NAME'= '',
  'mmr_VAX_COUNT'= '',
  'mmr_cnty'= '',
  'mumps_AgeAtLastVax'= '',
  'mumps_FACILITY_NAME'= '',
  'mumps_LAST_DOSE_DATE'= '',
  'mumps_ORGANIZATION_NAME'= '',
  'mumps_VAX_COUNT'= '',
  'mumps_cnty'= '',
  'noname_AgeAtLastVax'= '',
  'noname_FACILITY_NAME'= '',
  'noname_LAST_DOSE_DATE'= '',
  'noname_ORGANIZATION_NAME'= '',
  'noname_VAX_COUNT'= '',
  'noname_cnty'= '',
  'pneumo_pcv_AgeAtLastVax'= '',
  'pneumo_pcv_FACILITY_NAME'= '',
  'pneumo_pcv_LAST_DOSE_DATE'= '',
  'pneumo_pcv_ORGANIZATION_NAME'= '',
  'pneumo_pcv_VAX_COUNT'= '',
  'pneumo_pcv_cnty'= '',
  'pneumo_ppsv_AgeAtLastVax'= '',
  'pneumo_ppsv_FACILITY_NAME'= '',
  'pneumo_ppsv_LAST_DOSE_DATE'= '',
  'pneumo_ppsv_ORGANIZATION_NAME'= '',
  'pneumo_ppsv_VAX_COUNT'= '',
  'pneumo_ppsv_cnty'= '',
  'polio_AgeAtLastVax'= '',
  'polio_FACILITY_NAME'= '',
  'polio_LAST_DOSE_DATE'= '',
  'polio_ORGANIZATION_NAME'= '',
  'polio_VAX_COUNT'= '',
  'polio_cnty'= '',
  'rotavirus_AgeAtLastVax'= '',
  'rotavirus_FACILITY_NAME'= '',
  'rotavirus_LAST_DOSE_DATE'= '',
  'rotavirus_ORGANIZATION_NAME'= '',
  'rotavirus_VAX_COUNT'= '',
  'rotavirus_cnty'= '',
  'rubella_AgeAtLastVax'= '',
  'rubella_FACILITY_NAME'= '',
  'rubella_LAST_DOSE_DATE'= '',
  'rubella_ORGANIZATION_NAME'= '',
  'rubella_VAX_COUNT'= '',
  'rubella_cnty'= '',
  'small_shre_AgeAtLastVax'= '',
  'small_shre_FACILITY_NAME'= '',
  'small_shre_LAST_DOSE_DATE'= '',
  'small_shre_ORGANIZATION_NAME'= '',
  'small_shre_VAX_COUNT'= '',
  'small_shre_cnty'= '',
  'tdap_AgeAtLastVax'= '',
  'tdap_FACILITY_NAME'= '',
  'tdap_LAST_DOSE_DATE'= '',
  'tdap_ORGANIZATION_NAME'= '',
  'tdap_VAX_COUNT'= '',
  'tdap_cnty'= '',
  'varicella_AgeAtLastVax'= '',
  'varicella_FACILITY_NAME'= '',
  'varicella_LAST_DOSE_DATE'= '',
  'varicella_ORGANIZATION_NAME'= '',
  'varicella_VAX_COUNT' = '',
  'varicella_cnty' = '',
  'AnyContra' = '',
  row.names = NULL,
  check.names = FALSE )

writelabels <- function (new_df) {
  # output: Write a CSV from a table
  write.table ( new_df, 
                file="C:/Users/andrews/Local/ldata.csv", 
                col.names = T,
                row.names = F,
                na = '',
                sep = ',',
                append = T)
}

writeitout <- function (new_df) {
  # output: Write a CSV from a table
  write.table ( new_df, 
              file="C:/Users/andrews/Local/ldata.csv", 
              col.names = F,
              row.names = F,
              na = 'NA',
              sep = ',',
              append = T)
}

give_uniques <- function () {
  # exploration: dealing with unique names per field
  # and sort it because it outputs mixed up garbage...
  sort(unique(LaurensData$description))
}

clean_it <- function () {
  # start a timer, see how long this takes
  timein <- Sys.time()
  
  print ( 'starting' )
  # initial dataset
  ld <- LaurensData
  
  # initial: used to determine when we last passed by
  last_pass <- 0
  
  # loop: pass through every row and remake them in the new_df
  for ( row in 1:nrow( ld ) ) {
    current <- ld [row, 'ASIIS_PAT_ID']
    
    # next patient: check if initial row values are needed
    if ( current != last_pass ) {
      # if they are needed, write the current new_df cache
      if ( last_pass == 0 ) {
        writelabels( new_df )
      } else {
        writeitout ( new_df )
      }
      #rbind( new_df )
    
      # start anew, at the colony!
      new_df$ASIIS_PAT_ID <- ld [row, 'ASIIS_PAT_ID']
      new_df$birthdate    <- ld [row, 'birthdate']
      new_df$gender       <- ld [row, 'gender']
      new_df$race         <- ld [row, 'race']
      new_df$ethnicity    <- ld [row, 'ethnicity']
      new_df$city         <- ld [row, 'city']
      new_df$state        <- ld [row, 'state']
      new_df$zip          <- ld [row, 'zip']
      new_df$AnyContra    <- ld [row, 'AnyContra']
    }
    
    if ( ld [ row, 'description' ] == '' ) {
      # for vax without description, missing some details...
      new_df$noname_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$noname_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$noname_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$noname_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$noname_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$noname_cnty              <- ld [row, 'cnty']
    } else {
      new_df$noname_AgeAtLastVax      <- 'NA'
      new_df$noname_FACILITY_NAME     <- 'NA'
      new_df$noname_LAST_DOSE_DATE    <- 'NA'
      new_df$noname_ORGANIZATION_NAME <- 'NA'
      new_df$noname_VAX_COUNT         <- 'NA'
      new_df$noname_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'ANTHRAX' ) {
      new_df$anthrax_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$anthrax_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$anthrax_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$anthrax_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$anthrax_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$anthrax_cnty              <- ld [row, 'cnty']
    } else {
      new_df$anthrax_AgeAtLastVax      <- 'NA'
      new_df$anthrax_FACILITY_NAME     <- 'NA'
      new_df$anthrax_LAST_DOSE_DATE    <- 'NA'
      new_df$anthrax_ORGANIZATION_NAME <- 'NA'
      new_df$anthrax_VAX_COUNT         <- 'NA'
      new_df$anthrax_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'DTaP/DT/Td' ) {
      new_df$dtap_dt_td_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$dtap_dt_td_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$dtap_dt_td_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$dtap_dt_td_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$dtap_dt_td_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$dtap_dt_td_cnty              <- ld [row, 'cnty']
    } else {
      new_df$dtap_dt_td_AgeAtLastVax      <- 'NA'
      new_df$dtap_dt_td_FACILITY_NAME     <- 'NA'
      new_df$dtap_dt_td_LAST_DOSE_DATE    <- 'NA'
      new_df$dtap_dt_td_ORGANIZATION_NAME <- 'NA'
      new_df$dtap_dt_td_VAX_COUNT         <- 'NA'
      new_df$dtap_dt_td_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'FLU' ) {
      new_df$flu_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$flu_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$flu_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$flu_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$flu_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$flu_cnty              <- ld [row, 'cnty']
    } else {
      new_df$flu_AgeAtLastVax      <- 'NA'
      new_df$flu_FACILITY_NAME     <- 'NA'
      new_df$flu_LAST_DOSE_DATE    <- 'NA'
      new_df$flu_ORGANIZATION_NAME <- 'NA'
      new_df$flu_VAX_COUNT         <- 'NA'
      new_df$flu_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'HEP-A' ) {
      new_df$hep_a_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$hep_a_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$hep_a_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$hep_a_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$hep_a_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$hep_a_cnty              <- ld [row, 'cnty']
    } else {
      new_df$hep_a_AgeAtLastVax      <- 'NA'
      new_df$hep_a_FACILITY_NAME     <- 'NA'
      new_df$hep_a_LAST_DOSE_DATE    <- 'NA'
      new_df$hep_a_ORGANIZATION_NAME <- 'NA'
      new_df$hep_a_VAX_COUNT         <- 'NA'
      new_df$hep_a_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'HEP-B 2 DOSE' ) {
      new_df$hep_b_2_do_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$hep_b_2_do_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$hep_b_2_do_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$hep_b_2_do_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$hep_b_2_do_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$hep_b_2_do_cnty              <- ld [row, 'cnty']
    } else {
      new_df$hep_b_2_do_AgeAtLastVax      <- 'NA'
      new_df$hep_b_2_do_FACILITY_NAME     <- 'NA'
      new_df$hep_b_2_do_LAST_DOSE_DATE    <- 'NA'
      new_df$hep_b_2_do_ORGANIZATION_NAME <- 'NA'
      new_df$hep_b_2_do_VAX_COUNT         <- 'NA'
      new_df$hep_b_2_do_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'HEP-B 3 DOSE' ) {
      new_df$hep_b_3_do_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$hep_b_3_do_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$hep_b_3_do_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$hep_b_3_do_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$hep_b_3_do_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$hep_b_3_do_cnty              <- ld [row, 'cnty']
    } else {
      new_df$hep_b_3_do_AgeAtLastVax      <- 'NA'
      new_df$hep_b_3_do_FACILITY_NAME     <- 'NA'
      new_df$hep_b_3_do_LAST_DOSE_DATE    <- 'NA'
      new_df$hep_b_3_do_ORGANIZATION_NAME <- 'NA'
      new_df$hep_b_3_do_VAX_COUNT         <- 'NA'
      new_df$hep_b_3_do_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'HERPES ZOSTER' ) {
      new_df$herpes_zo_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$herpes_zo_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$herpes_zo_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$herpes_zo_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$herpes_zo_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$herpes_zo_cnty              <- ld [row, 'cnty']
    } else {
      new_df$herpes_zo_AgeAtLastVax      <- 'NA'
      new_df$herpes_zo_FACILITY_NAME     <- 'NA'
      new_df$herpes_zo_LAST_DOSE_DATE    <- 'NA'
      new_df$herpes_zo_ORGANIZATION_NAME <- 'NA'
      new_df$herpes_zo_VAX_COUNT         <- 'NA'
      new_df$herpes_zo_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'HIB' ) {
      new_df$hib_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$hib_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$hib_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$hib_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$hib_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$hib_cnty              <- ld [row, 'cnty']
    } else {
      new_df$hib_AgeAtLastVax      <- 'NA'
      new_df$hib_FACILITY_NAME     <- 'NA'
      new_df$hib_LAST_DOSE_DATE    <- 'NA'
      new_df$hib_ORGANIZATION_NAME <- 'NA'
      new_df$hib_VAX_COUNT         <- 'NA'
      new_df$hib_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'HPV' ) {
      new_df$hpv_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$hpv_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$hpv_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$hpv_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$hpv_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$hpv_cnty              <- ld [row, 'cnty']
    } else {
      new_df$hpv_AgeAtLastVax      <- 'NA'
      new_df$hpv_FACILITY_NAME     <- 'NA'
      new_df$hpv_LAST_DOSE_DATE    <- 'NA'
      new_df$hpv_ORGANIZATION_NAME <- 'NA'
      new_df$hpv_VAX_COUNT         <- 'NA'
      new_df$hpv_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'MEASLES' ) {
      new_df$measles_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$measles_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$measles_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$measles_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$measles_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$measles_cnty              <- ld [row, 'cnty']
    } else {
      new_df$measles_AgeAtLastVax      <- 'NA'
      new_df$measles_FACILITY_NAME     <- 'NA'
      new_df$measles_LAST_DOSE_DATE    <- 'NA'
      new_df$measles_ORGANIZATION_NAME <- 'NA'
      new_df$measles_VAX_COUNT         <- 'NA'
      new_df$measles_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'MENINGOCOCCAL' ) {
      new_df$meningo_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$meningo_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$meningo_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$meningo_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$meningo_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$meningo_cnty              <- ld [row, 'cnty']
    } else {
      new_df$meningo_AgeAtLastVax      <- 'NA'
      new_df$meningo_FACILITY_NAME     <- 'NA'
      new_df$meningo_LAST_DOSE_DATE    <- 'NA'
      new_df$meningo_ORGANIZATION_NAME <- 'NA'
      new_df$meningo_VAX_COUNT         <- 'NA'
      new_df$meningo_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'MENINGOCOCCAL B, OMV' ) {
      new_df$meningo_b_om_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$meningo_b_om_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$meningo_b_om_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$meningo_b_om_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$meningo_b_om_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$meningo_b_om_cnty              <- ld [row, 'cnty']
    } else {
      new_df$meningo_b_om_AgeAtLastVax      <- 'NA'
      new_df$meningo_b_om_FACILITY_NAME     <- 'NA'
      new_df$meningo_b_om_LAST_DOSE_DATE    <- 'NA'
      new_df$meningo_b_om_ORGANIZATION_NAME <- 'NA'
      new_df$meningo_b_om_VAX_COUNT         <- 'NA'
      new_df$meningo_b_om_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'MENINGOCOCCAL B, RECOMBINANT' ) {
      new_df$meningo_b_re_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$meningo_b_re_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$meningo_b_re_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$meningo_b_re_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$meningo_b_re_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$meningo_b_re_cnty              <- ld [row, 'cnty']
    } else {
      new_df$meningo_b_re_AgeAtLastVax      <- 'NA'
      new_df$meningo_b_re_FACILITY_NAME     <- 'NA'
      new_df$meningo_b_re_LAST_DOSE_DATE    <- 'NA'
      new_df$meningo_b_re_ORGANIZATION_NAME <- 'NA'
      new_df$meningo_b_re_VAX_COUNT         <- 'NA'
      new_df$meningo_b_re_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'MMR' ) {
      new_df$mmr_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$mmr_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$mmr_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$mmr_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$mmr_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$mmr_cnty              <- ld [row, 'cnty']
    } else {
      new_df$mmr_AgeAtLastVax      <- 'NA'
      new_df$mmr_FACILITY_NAME     <- 'NA'
      new_df$mmr_LAST_DOSE_DATE    <- 'NA'
      new_df$mmr_ORGANIZATION_NAME <- 'NA'
      new_df$mmr_VAX_COUNT         <- 'NA'
      new_df$mmr_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'MUMPS' ) {
      new_df$mumps_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$mumps_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$mumps_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$mumps_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$mumps_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$mumps_cnty              <- ld [row, 'cnty']
    } else {
      new_df$mumps_AgeAtLastVax      <- 'NA'
      new_df$mumps_FACILITY_NAME     <- 'NA'
      new_df$mumps_LAST_DOSE_DATE    <- 'NA'
      new_df$mumps_ORGANIZATION_NAME <- 'NA'
      new_df$mumps_VAX_COUNT         <- 'NA'
      new_df$mumps_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'NOVEL INFLUENZA H1N1-09' ) {
      new_df$h1n1_09_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$h1n1_09_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$h1n1_09_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$h1n1_09_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$h1n1_09_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$h1n1_09_cnty              <- ld [row, 'cnty']
    } else {
      new_df$h1n1_09_AgeAtLastVax      <- 'NA'
      new_df$h1n1_09_FACILITY_NAME     <- 'NA'
      new_df$h1n1_09_LAST_DOSE_DATE    <- 'NA'
      new_df$h1n1_09_ORGANIZATION_NAME <- 'NA'
      new_df$h1n1_09_VAX_COUNT         <- 'NA'
      new_df$h1n1_09_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'PNEUMO (PCV)' ) {
      new_df$pneumo_pcv_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$pneumo_pcv_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$pneumo_pcv_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$pneumo_pcv_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$pneumo_pcv_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$pneumo_pcv_cnty              <- ld [row, 'cnty']
    } else {
      new_df$pneumo_pcv_AgeAtLastVax      <- 'NA'
      new_df$pneumo_pcv_FACILITY_NAME     <- 'NA'
      new_df$pneumo_pcv_LAST_DOSE_DATE    <- 'NA'
      new_df$pneumo_pcv_ORGANIZATION_NAME <- 'NA'
      new_df$pneumo_pcv_VAX_COUNT         <- 'NA'
      new_df$pneumo_pcv_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'PNEUMO (PPSV)' ) {
      new_df$pneumo_ppsv_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$pneumo_ppsv_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$pneumo_ppsv_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$pneumo_ppsv_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$pneumo_ppsv_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$pneumo_ppsv_cnty              <- ld [row, 'cnty']
    } else {
      new_df$pneumo_ppsv_AgeAtLastVax      <- 'NA'
      new_df$pneumo_ppsv_FACILITY_NAME     <- 'NA'
      new_df$pneumo_ppsv_LAST_DOSE_DATE    <- 'NA'
      new_df$pneumo_ppsv_ORGANIZATION_NAME <- 'NA'
      new_df$pneumo_ppsv_VAX_COUNT         <- 'NA'
      new_df$pneumo_ppsv_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'POLIO' ) {
      new_df$polio_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$polio_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$polio_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$polio_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$polio_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$polio_cnty              <- ld [row, 'cnty']
    } else {
      new_df$polio_AgeAtLastVax      <- 'NA'
      new_df$polio_FACILITY_NAME     <- 'NA'
      new_df$polio_LAST_DOSE_DATE    <- 'NA'
      new_df$polio_ORGANIZATION_NAME <- 'NA'
      new_df$polio_VAX_COUNT         <- 'NA'
      new_df$polio_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'ROTAVIRUS' ) {
      new_df$rotavirus_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$rotavirus_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$rotavirus_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$rotavirus_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$rotavirus_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$rotavirus_cnty              <- ld [row, 'cnty']
    } else {
      new_df$rotavirus_AgeAtLastVax      <- 'NA'
      new_df$rotavirus_FACILITY_NAME     <- 'NA'
      new_df$rotavirus_LAST_DOSE_DATE    <- 'NA'
      new_df$rotavirus_ORGANIZATION_NAME <- 'NA'
      new_df$rotavirus_VAX_COUNT         <- 'NA'
      new_df$rotavirus_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'RUBELLA' ) {
      new_df$rubella_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$rubella_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$rubella_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$rubella_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$rubella_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$rubella_cnty              <- ld [row, 'cnty']
    } else {
      new_df$rubella_AgeAtLastVax      <- 'NA'
      new_df$rubella_FACILITY_NAME     <- 'NA'
      new_df$rubella_LAST_DOSE_DATE    <- 'NA'
      new_df$rubella_ORGANIZATION_NAME <- 'NA'
      new_df$rubella_VAX_COUNT         <- 'NA'
      new_df$rubella_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'SMALLPOX SHOT/READING' ) {
      new_df$small_shre_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$small_shre_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$small_shre_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$small_shre_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$small_shre_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$small_shre_cnty              <- ld [row, 'cnty']
    } else {
      new_df$small_shre_AgeAtLastVax      <- 'NA'
      new_df$small_shre_FACILITY_NAME     <- 'NA'
      new_df$small_shre_LAST_DOSE_DATE    <- 'NA'
      new_df$small_shre_ORGANIZATION_NAME <- 'NA'
      new_df$small_shre_VAX_COUNT         <- 'NA'
      new_df$small_shre_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'Tdap' ) {
      new_df$tdap_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$tdap_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$tdap_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$tdap_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$tdap_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$tdap_cnty              <- ld [row, 'cnty']
    } else {
      new_df$tdap_AgeAtLastVax      <- 'NA'
      new_df$tdap_FACILITY_NAME     <- 'NA'
      new_df$tdap_LAST_DOSE_DATE    <- 'NA'
      new_df$tdap_ORGANIZATION_NAME <- 'NA'
      new_df$tdap_VAX_COUNT         <- 'NA'
      new_df$tdap_cnty              <- 'NA'
    }
    if ( ld [ row, 'description' ] == 'VARICELLA' ) {
      new_df$varicella_AgeAtLastVax      <- ld [row, 'AgeAtLastVax']
      new_df$varicella_FACILITY_NAME     <- ld [row, 'FACILITY_NAME']
      new_df$varicella_LAST_DOSE_DATE    <- ld [row, 'LAST_DOSE_DATE']
      new_df$varicella_ORGANIZATION_NAME <- ld [row, 'ORGANIZATION_NAME']
      new_df$varicella_VAX_COUNT         <- ld [row, 'VAX_COUNT']
      new_df$varicella_cnty              <- ld [row, 'cnty']
    } else {
      new_df$varicella_AgeAtLastVax      <- 'NA'
      new_df$varicella_FACILITY_NAME     <- 'NA'
      new_df$varicella_LAST_DOSE_DATE    <- 'NA'
      new_df$varicella_ORGANIZATION_NAME <- 'NA'
      new_df$varicella_VAX_COUNT         <- 'NA'
      new_df$varicella_cnty              <- 'NA'
    }
    last_pass <- ld [row, 'ASIIS_PAT_ID']
  }
  
  timeout <- Sys.time()
  totaltime <- timeout - timein
  print ( totaltime )
}

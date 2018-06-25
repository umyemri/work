# immunization: lauren's data
# by 		Andrew Sikes
# created: 	06/23/2018
# modified: 	06/25/2018
# ===
# Loosely, the data structure is as follows:
'''
ASIIS_PAT_ID
birthdate
gender
race
ethnicity
city
state
zip
ORGANIZATION_NAME
FACILITY_NAME
description
VAX_COUNT
LAST_DOSE_DATE
AgeAtLastVax
AnyContra
cnty
'''
#
# After the data structure will look like the follwing:
'''
ASIIS_PAT_ID
birthdate
gender
race
ethnicity
city
state
zip
anthrax_AgeAtLastVax
anthrax_FACILITY_NAME
anthrax_LAST_DOSE_DATE
anthrax_ORGANIZATION_NAME
anthrax_VAX_COUNT
dtap_dt_td_AgeAtLastVax
dtap_dt_td_FACILITY_NAME
dtap_dt_td_LAST_DOSE_DATE
dtap_dt_td_ORGANIZATION_NAME
dtap_dt_td_VAX_COUNT
...
AnyContra
cnty
'''

import pandas as pd
import sys

# based on https://gist.github.com/aflaxman/4ec656c1127b214e32ff
def load_large_dta(data_path):
    import sys

    reader = pd.read_stata(data_path, iterator=True)
    df = pd.DataFrame()

    try:
        chunk = reader.get_chunk(100*1000)
        while len(chunk) > 0:
            df = df.append(chunk, ignore_index=True)
            chunk = reader.get_chunk(100*1000)
            print '.',
            sys.stdout.flush()
    except (StopIteration, KeyboardInterrupt):
        pass

    print '\nloaded {} rows'.format(len(df))

    return df

def table_structure():


def main():
    data_path = "C:\\Users\\andrews\\Local\\LaurensData.dta"

    load_large_dta(data_path)

main()

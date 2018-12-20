/* 
 * title: census_state_agg.sql
 * author: andrew sikes (andrews@uihi.org)
 * created: 20121218
 * modified: -
 * aim: aggregate census 2010 data into white non-hispanic & ai/an alone
 *      get percetages for each state. for large level stats
 *      application made in frustration with sas 9.4 handling of sql 
 *      procs
 */;

-- tier 0: all us population table
select sum( p0010001 ) as tot_us         -- total population in us
     , sum( p0020007 ) as tot_us_aian    -- total population in us for ai/an
     , ( cast( sum(p0020007) as float(8) ) / sum(p0010001) ) * 100 as aian_pct
                                         -- percentage from the total
     , sum( p0020005 ) as tot_us_wnh     -- total population in us for white non-hisp
     , ( cast( sum(p0020005) as float(8) ) / sum(p0010001) ) * 100 as wnh_pct
                                         -- percentage from the total
from  [dbo].[census_counties_2010];

-- tier 1: per state population table
select state_us_abbreviation as st_abbr
     , max( state_fips ) as st_fips
     , sum( p0010001 ) as tot_pop  -- total population in a state
     , sum( p0020007 ) as aian_pop -- total population of ai/an in that state
     , ( cast( sum(p0020007) as float(8) ) / sum(p0010001) ) * 100 as aian_pct
                                   -- ai/an percentage from the total
     , sum( p0020005 ) as wnh_pop  -- total population of white non-hispanic in that states
     , ( cast( sum(p0020005) as float(8) ) / sum(p0010001) ) * 100 as wnh_pct
                                   -- wnh percentage from the total
from [dbo].[census_counties_2010]
group by state_us_abbreviation
order by st_fips;

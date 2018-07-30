## countdown_workday.py
#
# i had some free time... not really, i should have been working on
# census data isolation. there are probably better ways of doing
# this...
#
import time, os, math, progressbar

def nowish():
	return time.localtime()

def main():
	daystart 	= float(input('Start of the day (e.g. 8.75 = 8:45 AM): '))
	
	shiftlength 	= 8.5
	interval 	= round( (shiftlength * 60) * 60 )
	
	ds_hr 		= math.floor(daystart)
	ds_min 		= round(abs(ds_hr - daystart) * 60)
	sl_hr 		= math.floor(shiftlength)
	sl_min 		= round(abs(sl_hr - shiftlength) * 60)
	endshift 	= daystart + shiftlength
	et_hr 		= math.floor(endshift)
	et_min 		= round(abs(et_hr - endshift) * 60)
	
	cur_day		= nowish().tm_mday
	cur_mon		= nowish().tm_mon
	cur_year	= nowish().tm_year
	cur_hour 	= nowish().tm_hour
	cur_min 	= nowish().tm_min
	cur_sec 	= nowish().tm_sec
	current_pt	= '{}.{}.{} {}:{}:{}'.format(cur_day, cur_mon, cur_year, \
				  cur_hour, cur_min, cur_sec)
	start_pt	= '{}.{}.{} {}:{}:00'.format(cur_day, cur_mon, cur_year, \
				  ds_hr, ds_min)
	end_pt		= '{}.{}.{} {}:{}:00'.format(cur_day, cur_mon, cur_year, \
				  et_hr, et_min)
	pattern 	= '%d.%m.%Y %H:%M:%S'
	current_ep 	= int(time.mktime(time.strptime(current_pt, pattern)))
	start_ep 	= int(time.mktime(time.strptime(start_pt, pattern)))
	end_ep 		= int(time.mktime(time.strptime(end_pt, pattern)))
	
	bar = progressbar.ProgressBar(term_width=31, maxval=interval, \
		widgets=[progressbar.Bar('=', '[', ']'), ' ', progressbar.Percentage()])
	
	os.system('cls')
	
	for i in range( abs(start_ep - current_ep), interval ):
		bar.start()
		bar.update(i + 1)
		
		cur_hour 	= nowish().tm_hour
		cur_min 	= nowish().tm_min
		cur_sec 	= nowish().tm_sec
		lf_hour 	= abs( et_hr - cur_hour )
		lf_min		= abs( cur_min - 59 )
		
		print()
		print( 'c: {:02d}:{:02d}:{:02d},'.format(cur_hour, cur_min, cur_sec), \
			end=' ' )
		print( 'g: {:02d}:{:02d},'.format(et_hr, et_min), end=' ' )
		print( 'l: {:02d}:{:02d}'.format(lf_hour, lf_min) )

		time.sleep(1)
		os.system('cls')
	
	bar.finish()
	print("Done!")

main()

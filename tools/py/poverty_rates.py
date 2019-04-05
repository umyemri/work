'''
title: poverty_rates.py
author: Andrew Sikes (andrews@uihi.org)
created: 20190401
aim: calculates poverty rates for federal/state grant reports.
'''

st_poverty = int(input('Enter starting poverty rate for 1 household member: '))
poverty_inc = int(input('Enter the poverty interval: '))
perc_1 = 1.50
perc_2 = 2.00

next_rate = 0

print('\t100%\t' + str(round(perc_1 * 100)) + '%\t' + str(round(perc_2 * 100)) + '%')
for i in range(1, 11):
	if (i == 1):
		next_rate = st_poverty
	else:
		next_rate = next_rate + poverty_inc
	print(str(i) + '\t' + str(next_rate) + '\t' + str(round(next_rate*perc_1)) + '\t' + str(round(next_rate*perc_2)))

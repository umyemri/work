'''
title: 	  poverty_rates.py
author:   Andrew 
created:  20190520
modified: 20190603
aim: calculates federal poverty rates from two variables: income and increment
	 then output SQL script.
edit: 20190528 - added sql output, organized code
'''

def hundred_perc(j, start_rate, next_rate, pov_incr):
	start_house = '\tWHEN Household_Income <= '
	family = ' AND Number_Of_Family_Members = '
	then_state = ' THEN '
	for i in range(1, 11):
		if (i == 1):
			print(start_house + \
				  str(start_rate) + \
				  family + \
				  str(i) + \
				  then_state + \
				  str(j))
			next_rate = start_rate
		else:
			next_rate = next_rate + pov_incr
			print(start_house + \
				  str(next_rate) + \
				  family + \
				  str(i) + \
				  then_state + \
				  str(j))

def between_perc1(j, start_rate, next_rate, pov_incr, perc_1):
	start_house = '\tWHEN Household_Income BETWEEN '
	family = ' AND Number_Of_Family_Members = '
	then_state = ' THEN '
	for i in range(1, 11):
		if (i == 1):
			print(start_house + \
				  str(start_rate + 1) + ' AND ' + \
				  str(int(start_rate * perc_1)) + \
				  family + \
				  str(i) + \
				  then_state + \
				  str(j))
			next_rate = start_rate
		else:
			next_rate = next_rate + pov_incr
			print(start_house + \
				  str(next_rate + 1) + ' AND ' + \
				  str(int(next_rate * perc_1)) + \
				  family + \
				  str(i) + \
				  then_state + \
				  str(j))

def between_perc2(j, start_rate, next_rate, pov_incr, perc_1, perc_2):
	start_house = '\tWHEN Household_Income BETWEEN '
	family = ' AND Number_Of_Family_Members = '
	then_state = ' THEN '
	for i in range(1, 11):
		if (i == 1):
			print(start_house + \
				  str(int(start_rate * perc_1) + 1) + ' AND ' + \
				  str(int(start_rate * perc_2)) + \
				  family + \
				  str(i) + \
				  then_state + \
				  str(j))
			next_rate = start_rate
		else:
			next_rate = next_rate + pov_incr
			print(start_house + \
				  str(int(next_rate * perc_1) + 1) + ' AND ' + \
				  str(int(next_rate * perc_2)) + \
				  family + \
				  str(i) + \
				  then_state + \
				  str(j))
				  
def twohundred_perc(j, start_rate, next_rate, pov_incr, perc_2):
	start_house = '\tWHEN Household_Income > '
	family = ' AND Number_Of_Family_Members = '
	then_state = ' THEN '
	for i in range(1, 11):
		if (i == 1):
			print(start_house + \
				  str(int(start_rate * perc_2)) + \
				  family + \
				  str(i) + \
				  then_state + \
				  str(j))
			next_rate = start_rate
		else:
			next_rate = next_rate + pov_incr
			print(start_house + \
				  str(int(next_rate * perc_2)) + \
				  family + \
				  str(i) + \
				  then_state + \
				  str(j))

def main():
	perc_1 = 1.50
	perc_2 = 2.00
	next_rate = 0

	print('-------------------------------------------------------------------')
	print('This script auto creates SQL code for Federal poverty rates.')
	print('-------------------------------------------------------------------')

	start_rate = int(input('Enter first poverty rate for 1 household member: '))
	pov_incr = int(input('Enter the poverty interval: '))
	
	print('-------------------------------------------------------------------')

	'''
	# old method
	print('\t100%\t' + str(round(perc_1 * 100)) + '%\t' + str(round(perc_2 * 100)) + '%')
	for i in range(1, 11):
		if (i == 1):
			next_rate = start_rate
		else:
			next_rate = next_rate + pov_incr
		print(str(i) + '\t' + str(next_rate) + '\t' + str(round(next_rate*perc_1)) + '\t' + str(round(next_rate*perc_2)))
	'''

	print('CASE')
	for j in range(1, 5):
		if(j == 1):
			print('\t-- <= 100%')
			hundred_perc(j, start_rate, next_rate, pov_incr)
		elif(j == 2):
			print('\t-- 101 to 150%')
			between_perc1(j, start_rate, next_rate, pov_incr, perc_1)
		elif(j == 3):
			print('\t-- 151 to 200%')
			between_perc2(j, start_rate, next_rate, pov_incr, perc_1, perc_2)
		elif(j == 4):
			print('\t-- > 200%')
			twohundred_perc(j, start_rate, next_rate, pov_incr, perc_2)
	print('\tELSE 0\n\tEND AS pov_rate')
	print('-------------------------------------------------------------------')

main()

'''
# old code
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

'''

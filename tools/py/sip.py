# sip: take the first 500 lines from a extremely large file
#

input_file = open('C:\\Users\\andrews\\Local\\LaurensData.dta', 'r')
output_file= open('C:\\Users\\andrews\\Local\\sip-output.txt', 'w')

for lines in range(500):
    line = input_file.readline()
    output_file.write(line)


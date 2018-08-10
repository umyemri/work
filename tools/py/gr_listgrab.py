# title: goodreads list grab
# author: umyemri
# date: 20180809
# aim: point script at url for a goodreads list and harvest the following:
#      0. rank in list
#      1. book title
#      2. author
#      3. rating
#      4. rating votes
# it then outputs a csv
#
# limitation: currently only takes the first 100 selections, need to make a crawler...
#

from bs4 import BeautifulSoup as bs
from urllib.request import urlopen
import pandas as pd
import sys, re, getopt

def listgrab( list_url, csv_output ):
	html = urlopen(list_url)
	
	booksoup = bs(html, "lxml")
	
	raw_ranks	= booksoup.findAll("td", {"class":"number"})
	raw_titles	= booksoup.findAll("a", {"class":"bookTitle"})
	raw_authors = booksoup.findAll("a", {"class":"authorName"})
	raw_ratings = booksoup.findAll("span", {"class":"minirating"})

	ranks 		= []
	titles		= []
	authors		= []
	ratings		= []
	votes		= []
	
	temp_raw	= ''
	temp_votes  = ''
	re_votes	= ''
	re_pattern 	= '(\d{1,})(,\d{1,})|\d{1,}'
	
	for entry in raw_ranks:
		ranks.append( entry.get_text() )
		
	for entry in raw_titles:
		titles.append( entry.get_text().strip() )

	for entry in raw_authors:
		authors.append( entry.get_text() )
		
	for entry in raw_ratings:
		temp_raw 	= entry.get_text()
		temp_votes	= temp_raw[19:]
		re_votes 	= re.search(re_pattern, temp_votes)
		
		ratings.append( temp_raw[1:5] )
		votes.append( re_votes.group(0) )
	
	gr_list = pd.DataFrame( { 'rank': ranks,
							'titles': titles,
							'author': authors,
							'rating': ratings,
							'votes' : votes } )
							
	gr_list.to_csv(csv_output, sep=',', index=False, encoding='utf-8')

def main(argv):
   inputurl = ''
   outputfile = ''
   try:
      opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
   except getopt.GetoptError:
      print( 'gr_listgrab.py -i <inputurl> -o <outputfile>' )
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print( 'gr_listgrab.py -i <inputurl> -o <outputfile>' )
         sys.exit()
      elif opt in ("-i", "--ifile"):
         inputurl = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg
   print( 'Input URL is {}'.format(inputurl) )
   print( 'Output file is {}'.format(outputfile) )
   listgrab( inputurl, outputfile )

if __name__ == "__main__":
   main( sys.argv[1:] )

# title: goodreads list grab
# author: umyemri
# date: 20180809
# aim: point script at url for a goodreads list and harvest the following:
#      1. book title
#      2. author
#      3. rating
#      4. url to goodreads' book entry
# it then outputs a csv
#

import os, sys, csv
from bs4 import BeautifulSoup as bs
from urllib.request import urlopen

def main():
	url = 'https://www.goodreads.com/list/show/71245.HBO_s_True_Detective'
	
	html = urlopen(url)
	
	# <a class="authorName" itemprop="url" href="https://www.goodreads.com/author/show/128466.Thomas_Ligotti"><span itemprop="name">Thomas Ligotti</span></a>
	
	booksoup = bs(html, "lxml")
	
	# for i in booksoup.find("table", {"class":"tableList js-dataTooltip"}).tr.next_siblings:
		# print(" {}: {} ".format(point, i))
		# point = point + 1
		
	numbers	= booksoup.findAll("td", {"class":"number"})
	titles	= booksoup.findAll("a", {"class":"bookTitle"})
	authors = booksoup.findAll("a", {"class":"authorName"})
	ratings = booksoup.findAll("span", {"class":"minirating"})
	
	for i in ratings:
		print( i.get_text() )

	# 309 ch: <span class="minirating"><span class="stars staticStars"><span class="staticStar p10" size="12x12"></span><span class="staticStar p10" size="12x12"></span><span class="staticStar p10" size="12x12"></span><span class="staticStar p6" size="12x12"></span><span class="staticStar p0" size="12x12"></span></span> 3.67 avg rating — 3 ratings</span>

main()

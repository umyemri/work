import math
from PIL import Image, ImageDraw

def splitter(str, k):

    palatte = {
          'a': '#bd93f9' # adenine
        , 'c': '#ff5555' # cytosine
        , 'g': '#50fa7b' # guanine
        , 't': '#6272a4' # thymine
    }

    image = Image.new( "RGB", (k+1,k+5) )
    dctx = ImageDraw.Draw(image)
    x = 0 + 1
    y = 0 + 1

    for pixel in str:
        if x == k:
            x = 0 + 1
            y += 1
        dctx.point( [x, y], fill=palatte[pixel] )
        x += 1

    image.save('./covid-19.png', "PNG")

file = open('./covid-19.txt', 'r')
content = file.read()

splitter( content, math.floor(math.sqrt(len(content))) )

file.close()

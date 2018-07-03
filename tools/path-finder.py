import os, io, time

start_time = time.time()
startpath  = 'C:\\Users\\andrews\\'
newfile    = 'C:\\Users\\andrews\\Local\\paths.txt'
content    = ''
totaldirs  = 0
totalfiles = 0

with io.open (newfile, 'a', encoding='utf-8') as myfile:

    print('processing...')

    for root, dirs, files in os.walk(startpath):
        level     = root.replace(startpath, '').count(os.sep)
        indent    = u'\t' * (level)
        content   = content + u'{}{}/'.format(indent, os.path.basename(root)) + '\n'
        subindent = u'\t' * (level + 1)
        
        for f in files:
            content = content + u'{}{}'.format(subindent, f) + u'\n'

    myfile.write(content)
    myfile.close()
    print('complete!')
    elapsed_time = time.time() - start_time
    print(elapsed_time)

# mother of god... will it ever stop...

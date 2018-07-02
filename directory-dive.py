import os, io

startpath="U:\\"

with io.open ("C:\\Users\\andrews\\Local\\paths-U.txt", "a", encoding="utf-8") as myfile:
    for root, dirs, files in os.walk(startpath):
        level = root.replace(startpath, '').count(os.sep)
        indent = '\t' * (level)
        myfile.write('{}{}/'.format(indent, os.path.basename(root)) + '\n')
        subindent = '\t' * (level + 1)
        for f in files:
            myfile.write('{}{}'.format(subindent, f) + '\n')
        print(".", end=" ")
            
    myfile.close()

# mother of god... will it ever stop...

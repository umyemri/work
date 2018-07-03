import os, io, time

start_time = time.time()
startpath = "U:\\"
content   = ""

with io.open ("C:\\Users\\andrews\\Local\\paths-U.txt", "a", encoding="utf-8") as myfile:
    print("processing...")
    for root, dirs, files in os.walk(startpath):
        level = root.replace(startpath, '').count(os.sep)
        indent = '\t' * (level)
        content = content + '{}{}/'.format(indent, os.path.basename(root)) + '\n'
        subindent = '\t' * (level + 1)
        for f in files:
            content = content + '{}{}'.format(subindent, f) + '\n'
    myfile.write(content)
    myfile.close()
    print("complete!")
    elapsed_time = time.time() - start_time
    print(elapsed_time)

# mother of god... will it ever stop...

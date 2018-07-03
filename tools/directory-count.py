import io

dirnumb = 0

with io.open ("C:\\Users\\andrews\\Local\\paths-U.txt", "r", encoding="utf-8") as myfile:
    for line in myfile:
        for chars in line:
            if chars == "/":
                dirnumb = dirnumb + 1
            
    myfile.close()

print(dirnumb)

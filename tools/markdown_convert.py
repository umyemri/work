# something quick: since i can't install notepad++ plugins...
import markdown

def main():
	file_md = "C:\\Users\\andrews\\Local\\notes\\meeting-notes-20180717.md"
  html_file = "C:\\Users\\andrews\\Local\\notes\\meeting-notes-20180717.html"

	input_file = open(file_md, "r")
	markdown_text = input_file.read()
	html = markdown.markdown(markdown_text)
	
	output_file = open(html_file, "w")
	output_file.write(html)
	
main()

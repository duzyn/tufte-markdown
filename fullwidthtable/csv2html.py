import os, sys, csv

nargs = len(sys.argv)
if not 2 <= nargs <= 3:
	print "usage: %s infile [outfile]" % os.path.basename(sys.argv[0])
else:
	input_file = sys.argv[1]
	# print in screen as default
	output_file = sys.stdout

	table = ""
	with open(input_file, 'rb') as csvfile:
		reader = csv.reader(csvfile)

		table += "<table border='1'>\n"
		for row in reader:
			table += "<tr>\n" + "".join(["<td>%s</td>\n" % 
				     item for item in row]) + "</tr>\n"
		table += "</table>\n"

	# print to file if it's given
	if nargs > 2:
		with open(sys.argv[2], 'w') as htmlfile:
			htmlfile.write(table)

		print "All done.. Printed to %s." % sys.argv[2]
	else:
		output_file.write(table)
		output_file.close()

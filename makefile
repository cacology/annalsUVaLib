timeline.csv: timeline.dsv
	csvfix read_dsv -s '\t' timeline.dsv > timeline.csv

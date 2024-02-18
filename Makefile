default:
	mkdir -p input
	make convert

prep: default
	ls -d /samba/share
	cp -prv /samba/share/*.csv input

test: default
	cp -p testdata/csv_to_json/*.csv input
	make convert

convert:
	ruby bin/csv_to_json.rb

clean:
	rm -rf input

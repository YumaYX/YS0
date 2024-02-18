default:
	@cat Makefile

exec:
	mkdir -p input
	make convert

prep: exec
	ls -d /samba/share
	cp -prv /samba/share/*.csv input

test: exec
	cp -p testdata/csv_to_json/*.csv input
	make convert

convert:
	ruby bin/csv_to_json.rb

reset:
	rm -f input/*.json

clean:
	rm -rf input

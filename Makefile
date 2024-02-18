TARGETDIR := input
SAMBADIR  := /samba/share

default:
	@cat Makefile

exec:
	mkdir -p $(TARGETDIR)
	make convert

prep: exec
	ls -d $(SAMBADIR)
	cp -v $(SAMBADIR)/*.csv $(TARGETDIR)

test: exec
	cp -p testdata/csv_to_json/*.csv $(TARGETDIR)
	make convert
	ruby bin/control_json.rb

convert:
	ruby bin/csv_to_json.rb

reset:
	rm -f $(TARGETDIR)/*.json

clean:
	rm -rf $(TARGETDIR)

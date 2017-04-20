PROVIDER := test

.PHONY: default
default: example.box

example.box: tmp/metadata.json
	cd tmp && tar -czvf ../$@ metadata.json

tmp/metadata.json: tmp/
	jq -n -f templates/metadata.json \
	  --argjson provider '"$(PROVIDER)"' \
	  > $@

tmp/:
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf example.box tmp/

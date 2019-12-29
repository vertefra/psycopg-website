.PHONY: build serve setup

build:
	cd psycopg && ../env/bin/lektor build -O ../build

publish:
	(cd build && git add -A && git commit -m "updated on $$(date -Iseconds)")
	git add -A psycopg
	git add build
	git commit -m "content changed on $$(date -Iseconds)"
	git push
	(cd build && git push)

serve:
	cd psycopg && ../env/bin/lektor serve

setup:
	test -d env || virtualenv -p python3 env
	test -x env/bin/lektor || env/bin/pip install -r requirements.txt

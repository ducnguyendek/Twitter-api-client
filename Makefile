NAME := twitter_gateway
VERSION := 0.0.0

.PHONY: check
check:
	pep8 $(NAME)

env:
	virtualenv  --python=python3.6 env
	env/bin/pip install -r requirement.txt

.PHONY: test
test: env
	env/bin/py.test --verbose $(NAME)

.PHONY: clean
clean:
	find . -name '*.py[oc]' -delete
	rm -rf *.egg-info
	rm -rf env
	export TWITTER_TOKEN=""

.PHONY: run
run:
	(\
	. env/bin/activate; \
	export TWITTER_ACCESS_KEY=1048576964292882432-zdApOvKXyCE0wn4e2wcQieq9kcHRPg;\
	export TWITTER_ACCESS_SECRET=QIn7a0aa3HKQhRlnb5mMbJ6FIA2s5Ouk1rwpVNxGzJ3a9;\
	export TWITTER_CONSUMER_KEY=RunUEITrqwaGKKxc84UVkUvnY;\
	export TWITTER_CONSUMER_SECRET=V49AY73xsOUvpitVfz5Cx9TgFkrEUMGQfcO3tcAYrsZM13MIxm;\
	export FLASK_APP=$(NAME)/app.py; \
	export FLASK_ENV=development;\
	python -m flask run;\
	)

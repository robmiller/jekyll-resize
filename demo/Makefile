default: install

all: install build

h help:
	@grep '^[a-z]' Makefile

install:
	bundle config --local path vendor/bundle
	bundle install

clean:
	# Force generation with plugin each time.
	rm -rf cache/resize/

s serve: clean
	bundle exec jekyll serve --trace --livereload

build: clean
	bundle exec jekyll build --trace

	ls -l -h assets
	ls -l -h cache/resize

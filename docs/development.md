# Development


## Clone

Clone the repo.

```sh
$ git clone git@github.com:MichaelCurrin/jekyll-resize.git
$ cd jekyll-resize
```

There are no dependencies to install.


## Build

```sh
$ make build-gem
```

This will output an archive file e.g. `jekyll-resize-1.1.0.gem`.

This is can be ignored from version control - the gem can still be installed using a GitHub URL.


## Release

Commit and push changes. It will be available on master - you do not need to tag.

Then run this in another project to get the latest version of this gem:

```sh
$ bundle update
```

When you are done testing this, update the version number in the gemspec file and tag the repo.

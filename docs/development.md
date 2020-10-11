# Development

## Setup

Clone the repo.

Install dependencies with Bundler.


## Build

```sh
$ gem build jekyll-resize.gemspec
```

This will output an archive. This is can be ignored from version control - the gem can still be installed using a GitHub URL.


## Release

Commit and push changes. It will be available on master - you do not need to tag.

Then run this in another project to get the latest version of this gem.

```sh
$ bundle update
```

When you are done testing this, update the version number in the gemspec file and tag the repo.




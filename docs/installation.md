# Installation
> How to setup jekyll-resize in to your project


## Requirements

- Ruby
- Jekyll 3 or 4
- GraphicsMagick

### Internal dependencies

- [minimagick/minimagick](https://github.com/minimagick/minimagick)
    - "A ruby wrapper for ImageMagick or GraphicsMagick command line."
    - Sample use is covered in the readme - e.g. `image.resize "100x100"`.


## Install system dependencies

- Install GraphicsMagick.
    - [gist instructions](https://gist.github.com/MichaelCurrin/32b88b2c70c59832c922bcf03bdc08c3).
- Install Ruby and Bundler (recommended) at the user level.
    - [gist instructions](https://gist.github.com/MichaelCurrin/3af38fca4e2903cdedfb8402c18b2936).


## Install project dependencies

Note that the install URL in step 2 points to this fork repo on GH and not to RubyGems. The original gem is available on RubyGems with `gem 'jekyll-resize'`, but it only supports Jekyll 3, hence the reason this fork exists.

1. Recommended - add either Jekyll 3 or 4 as a project gem in `Gemfile`.
    ```ruby
    source 'https://rubygems.org'

    gem "jekyll", "~> 4.0.1"
    ```
1. Add `jekyll-resize` to your project's `Gemfile` using a GitHub URL.
    ```ruby
    group :jekyll_plugins do
      gem "jekyll-resize", git: "https://github.com/MichaelCurrin/jekyll-resize"
    end
    ```
1. Install your project's gems.
    ```sh
    $ bundle install
    ```

Note you do not have to enabel a gem to your `plugins` list in the config if it appears in the plugins group as above.


## Configure

The resized image output is saved to a temporary cache directory at build time.

This directory should be added to your git ignore file:

```
cache/
```

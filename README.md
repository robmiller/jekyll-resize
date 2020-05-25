# Jekyll Resize
> Image resizing tag for Jekyll 4

[![Made with Ruby](https://img.shields.io/badge/Made_with-Ruby-blue.svg)](https://ruby-lang.org)
[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/jekyll-resize)](https://github.com/MichaelCurrin/jekyll-resize/tags/)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/MichaelCurrin/jekyll-resize/blob/master/LICENSE)


Create resized images at build time when making a [Jekyll](https://jekyllrb.com) static site.


## Sample

```liquid
{{ image_path | resize: '800x800>' }}
```

See more details in [Usage](#usage) section.


## About

Forked from [CloudCannon/jekyll-resize](https://github.com/CloudCannon/jekyll-resize) ([RubyGems jekyll-resize](https://rubygems.org/gems/jekyll-resize)) to add Jekyll 4 support for my projects.

Changes:

- Updated [jekyll-resize.gemspec](/jekyll-resize.gemspec) to use Jekyll 4.
- Added `require "mini_magick"` to the [jekyll-resize.rb](/lib/jekyll-resize.rb) file to avoid a runtime error (which was not present on Jekyll 3).
- Added docs.


## Requirements

- Ruby
- Jekyll 4
- GraphicsMagick

### Internal dependencies

- [minimagick/minimagick](https://github.com/minimagick/minimagick)
    - > A ruby wrapper for ImageMagick or GraphicsMagick command line.
    - Sample use is covered in the readme - e.g. `image.resize "100x100"`.


## Installation

### Install system dependencies

- Install GraphicsMagick.
    - [gist instructions](https://gist.github.com/MichaelCurrin/32b88b2c70c59832c922bcf03bdc08c3).
- Install Ruby and Bundler (recommended) at the user level.
    - [gist instructions](https://gist.github.com/MichaelCurrin/3af38fca4e2903cdedfb8402c18b2936).

### Install project dependencies

1. Recommended - add Jekyll as a project gem:
  ```ruby
  source 'https://rubygems.org'

  gem 'jekyll', '~> 4.0.1'
  ```
1. Add `jekyll-resize` to your project's `Gemfile`:
    ```ruby
    group :jekyll_plugins do
    gem 'jekyll-resize', git: 'https://github.com/MichaelCurrin/jekyll-resize'
    end
    ```
1. Install your project's gems.
    ```sh
    $ bundle install
    ```

### Configure

Add to your `.gitignore` file:

```
cache/
```


## Usage

This plugin makes the `resize` tag available.

```
resize: OPTIONS
```

Pass an image path to the tag so it can be resized and saved to `cache/resize/`.

### Examples

```liquid
{{ image_path | resize: "800x800>" }}
```

```liquid
[My image]({{ image_path | resize: "800x800>" }})
```

### Output

Sample output logged on build:

```
Thumbnailing .../my-project/uploads/1.jpg to .../my-project/cache/resize/c673c80c6...5a92_800x800.jpg (800x800>)
```

Sample filename in `cache/resize/` - it's much longer that this.

```
c673c80c6...5a92_800x800.jpg
```


## Contributing

Submit a Pull Request if you have improvments.


## Development

Commit and push changes. You do not need to tag.

Run this in another project to get the latest version of the gem.

```sh
$ bundle update
```


## License

Released under [MIT](/LICENSE).

Original license - [MIT](/LICENSE-source).

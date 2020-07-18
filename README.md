# Jekyll Resize
> Image resizing filter for Jekyll 3 and 4

[![Made with Ruby](https://img.shields.io/badge/Made_with-Ruby-blue.svg)](https://ruby-lang.org)
[![Jekyll](https://img.shields.io/badge/jekyll-3.3+,_4.x-blue.svg)](https://jekyllrb.com)
[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/jekyll-resize)](https://github.com/MichaelCurrin/jekyll-resize/tags/)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/MichaelCurrin/jekyll-resize/blob/master/LICENSE)

If your page is loading too slowly because of large images and you can't be bothered to manually create thumbnails (images with reduced dimensions), then this Jekyll filter is for you.

It will create downsized images from your existing images at build time - resizing only images that need to be resized, providing an easy way to embed the image and allowing and dimensions you wish.
The full-size image is unaffected.

This flow is useful for loading a gallery of thumbnails. You can then link to the full-size image that comes up as an overlay or standaline image page.


## Sample

Add the gem to your Gemfile:

```ruby
group :jekyll_plugins do
  gem 'jekyll-resize', git: 'https://github.com/MichaelCurrin/jekyll-resize'
end
```

Then use it like this in markdown or HTML:

```liquid
{{ image_path | resize: '800x800>' }}
```

This takes care of both generating the thumbnail image for you as well as providing a link to the file.

See more details in [Usage](#usage) section.


## About

Forked from [CloudCannon/jekyll-resize](https://github.com/CloudCannon/jekyll-resize) ([RubyGems jekyll-resize](https://rubygems.org/gems/jekyll-resize)) to add Jekyll 4 support for my projects.

Notable changes:

- Updated [jekyll-resize.gemspec](/jekyll-resize.gemspec) to use Jekyll 4.
- Added `require "mini_magick"` to the [jekyll-resize.rb](/lib/jekyll-resize.rb) file to avoid a runtime error as constant `MiniMagick::Image` not defined (this error was not present on Jekyll 3).
- Created README.md file.


## Requirements

- Ruby
- Jekyll 3 or 4
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
1. Add `jekyll-resize` to your project's `Gemfile` using a GitHub URL:
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

Add this to your `.gitignore` file:

```
cache/
```


## Usage

This plugin makes the `resize` filter available.

It can be used like this:

```
resize: OPTIONS
```

Pass an image path to the filter so it can be resized and saved to `cache/resize/`. The filter will both resize the image and ensure the HTML path points to the generated resized image. 

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

Submit a Pull Request if you have improveents.


## Development

Commit and push changes. You do not need to tag.

Run this in another project to get the latest version of the gem.

```sh
$ bundle update
```


## License

Released under [MIT](/LICENSE).

Original license - [MIT](/LICENSE-source).

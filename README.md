# Jekyll Resize
> Image resizing filter for Jekyll 3 and 4

[![Made with Ruby](https://img.shields.io/badge/Ruby-2.x-blue.svg?logo=ruby)](https://ruby-lang.org)
[![Jekyll](https://img.shields.io/badge/jekyll->=3.3,_4.x-blue.svg?logo=jekyll)](https://jekyllrb.com)
[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/jekyll-resize)](https://github.com/MichaelCurrin/jekyll-resize/tags/)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/MichaelCurrin/jekyll-resize/blob/master/LICENSE)

If your page is loading too slowly because of large images and you can't be bothered to manually create thumbnails (images with reduced dimensions), then this Jekyll filter is for you.

This easy-to-use filter will create and link to a thumbnail version of your image, so your page can load quickly.


## Sample usage

Add the plugin gem to your Gemfile and then install it with Bundler.

```ruby
gem "jekyll-resize", git: "https://github.com/MichaelCurrin/jekyll-resize"
```

Now you can use the filter like this, in markdown or HTML:

```liquid
{{ image_path | resize: "800x800>" }}
```

That takes care of both generating the thumbnail image for you as well as providing a link to the file - magic.

See more details in [Usage](#usage) section.


### Demo of an image gallery

This filter is especially useful if you have a gallery of say 20 images and loading all full-sized images would be terribly slow. 
Once you have the thumbnails embedded on the page, you can easily link each to the original full-size image so it can open in a modal overlay or a separate page. 

Here is a Jekyll project that uses this filter for a gallery and allows viewing of then full-size images.

- https://github.com/MichaelCurrin/artists-portfolio


## Features

What this filter can do:

- Create downsized images from your existing images
- Resizing is done at build time so thumbnails are always up to date
- Resize only images that need to be resized
- Provides an easy way to embed the image 
- Allow any dimensions you wish.
- The full-size image is preserved.


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

Note that the install URL in step 2 points to this fork repo on GH and not to RubyGems. The original gem is available on RubyGems with `gem 'jekyll-resize'`, but it only supports Jekyll 3, hence the reason this fork exists.

1. Recommended - add either Jekyll 3 or 4 as a project gem:
    ```ruby
    source 'https://rubygems.org'

    gem "jekyll", "~> 4.0.1"
    ```
1. Add `jekyll-resize` to your project's `Gemfile` using a GitHub URL:
    ```ruby
    group :jekyll_plugins do
      gem "jekyll-resize", git: "https://github.com/MichaelCurrin/jekyll-resize"
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

Build the URL to a resized image:

```liquid
{{ image_path | resize: "800x800>" }}
```

In Markdown:

```liquid
![My image]({{ image_path | resize: "800x800>" }})
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

Submit a Pull Request if you have improvements.


## Development

Commit and push changes. You do not need to tag.

Run this in another project to get the latest version of this gem.

```sh
$ bundle update
```


## Related projects 

- [CloudCannon/jekyll-resize](https://github.com/CloudCannon/jekyll-resize) - the original for this repo.
- [rbuchberger/jekyll_picture_tag](https://github.com/rbuchberger/jekyll_picture_tag)
- [mmistakes/jekyll-picture-tag](https://github.com/mmistakes/jekyll-picture-tag) - a fork of the above by `@mmistakes`.


## License

Released under [MIT](/LICENSE).

Original license - [MIT](/LICENSE-source). Forked from [CloudCannon/jekyll-resize](https://github.com/CloudCannon/jekyll-resize) ([RubyGems jekyll-resize](https://rubygems.org/gems/jekyll-resize)) to add Jekyll 4 support for my projects.

Notable changes:

- Updated [jekyll-resize.gemspec](/jekyll-resize.gemspec) to use Jekyll 4.
- Added `require "mini_magick"` to the [jekyll-resize.rb](/lib/jekyll-resize.rb) file to avoid a runtime error as constant `MiniMagick::Image` not defined (this error was not present on Jekyll 3).
- Created this `README.md` file.

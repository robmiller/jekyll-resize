# Jekyll Resize
> Easy image resizing filter for Jekyll 3 and 4

[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/jekyll-resize)](https://github.com/MichaelCurrin/jekyll-resize/tags/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/MichaelCurrin/jekyll-resize/blob/master/LICENSE)

[![Made with Ruby](https://img.shields.io/badge/Ruby->=2.6-blue.svg?logo=ruby)](https://ruby-lang.org)
[![Jekyll](https://img.shields.io/badge/jekyll->=3.3,_4.x-blue.svg?logo=jekyll)](https://jekyllrb.com)


If your page is loading too slowly because of large images and you can't be bothered to manually create thumbnails (images with reduced dimensions), then this Jekyll filter is for you.

This easy-to-use filter will create and link to a thumbnail version of your image, so your page can load quickly.


## Features

What this filter can do:

- Create downsized images from your existing images.
- Resizing is done at build time so thumbnails are always up to date.
- Resize only images that need to be resized.
- Provides an easy way to embed the image.
- Allow any dimensions you wish.
- The full-size image is preserved.
- Validates images - you'll get an error at build time.


## Sample usage

Add the plugin gem to your Gemfile and then install it with Bundler.

```ruby
group :jekyll_plugins do
  gem "jekyll-resize", git: "https://github.com/MichaelCurrin/jekyll-resize"
end
```

Now you can use the `resize` filter in your markdown or HTML:

```liquid
{{ image_path | resize: "800x800>" }}
```

That takes care of both generating the thumbnail image for you as well as providing a link to the file - magic.

See more details in the [Usage](/docs/usage.md) part of the docs.


## Documentation

[![View - Documentation](https://img.shields.io/badge/View-Documentation-blue?style=for-the-badge)](/docs/)


## Demo
> See the plugin use in a Jekyll site

This filter is especially useful if you have a gallery of say 20 images and loading all full-sized images would be terribly slow. 
Once you have the thumbnails embedded on the page, you can easily link each to the original full-size image so it can open in a modal overlay or a separate page. 

Here is a Jekyll project that uses this filter for a gallery and allows viewing of then full-size images.

[![MichaelCurrin - artists-portfolio](https://img.shields.io/static/v1?label=MichaelCurrin&message=artists-portfolio&color=blue&logo=github)](https://github.com/MichaelCurrin/artists-portfolio)


## Related projects 

- [CloudCannon/jekyll-resize](https://github.com/CloudCannon/jekyll-resize) - the original for this repo.
- [rbuchberger/jekyll_picture_tag](https://github.com/rbuchberger/jekyll_picture_tag)
- [mmistakes/jekyll-picture-tag](https://github.com/mmistakes/jekyll-picture-tag) - a fork of the above by `@mmistakes`.


## Contributing

Submit a Pull Request or issue if you have improvements or fixes to suggest.


## License

Released under [MIT](/LICENSE) by [@MichaelCurrin](https://github.com/MichaelCurrin).

Original license - [MIT](/LICENSE-source). Forked from [CloudCannon/jekyll-resize](https://github.com/CloudCannon/jekyll-resize) ([RubyGems jekyll-resize](https://rubygems.org/gems/jekyll-resize)) to add Jekyll 4 support for my projects.

Notable changes:

- Updated [jekyll-resize.gemspec](/jekyll-resize.gemspec) to use Jekyll 4.
- Added `require "mini_magick"` to the [jekyll-resize.rb](/lib/jekyll-resize.rb) file to avoid a runtime error as constant `MiniMagick::Image` not defined (this error was not present on Jekyll 3).
- Created this `README.md` file and the [docs](/docs) directory.

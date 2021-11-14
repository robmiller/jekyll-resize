# Jekyll Resize 🖼 🤏 🔬
> Simple image resizing filter for Jekyll 3 and 4

[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/jekyll-resize)](https://github.com/MichaelCurrin/jekyll-resize/tags/ "Go to GitHub tags")
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](#license "Go to License section")

[![Made with Ruby](https://img.shields.io/badge/Ruby->=2.6-blue.svg?logo=ruby)](https://ruby-lang.org "Go to Ruby homepage")
[![Jekyll](https://img.shields.io/badge/jekyll->=3.3,_4.x-blue.svg?logo=jekyll)](https://jekyllrb.com "Go to Jekyll homepage")


## Sample usage

Add the plugin gem to your Gemfile as below, then install it with Bundler.

```ruby
group :jekyll_plugins do
  gem "jekyll-resize", git: "https://github.com/MichaelCurrin/jekyll-resize"
end
```

The `resize` filter will be available in Liquid (in your Markdown and HTML) so you can use it for a JPEG or PNG file.

Here we resize an image to max width and max height of 800 pixels:

```liquid
{{ "my-image.png" | resize: "800x800>" }}
```

That takes care of:

- _generating_ the reduced image.
- providing a _link_ to the file.

See the docs linked below for a more detailed example using the filter with an HTML `img` tag.


## Documentation
> Why you should use this plugin and how to install and use it in a Jekyll project

<div align="center">

[![View - Documentation](https://img.shields.io/badge/View-Documentation-blue?style=for-the-badge)](/docs/ "Go to docs")

</div>


## Contributing

See [Contributing](/CONTRIBUTING.md) doc.


## License

Released under [MIT](/LICENSE) by [@MichaelCurrin](https://github.com/MichaelCurrin).

Original license - [MIT](/LICENSE-source).

This project was forked from the [CloudCannon/jekyll-resize](https://github.com/CloudCannon/jekyll-resize) repo ([jekyll-resize](https://rubygems.org/gems/jekyll-resize) on RubyGems). So that I could use this in my Jekyll 4 project and so others can too.

Notable changes:

- Updated [jekyll-resize.gemspec](/jekyll-resize.gemspec) to use Jekyll 4.
- Updated [jekyll-resize.rb](/lib/jekyll-resize.rb) file.
    - Reworded "Thumbnailing" to "Resizing", because this doesn't have to be used to make thumbnails (which are very small).
    - Reduced hash from 64 to 32 characters long.
    - Created functions to break up the logic.
    - Refactored variable names and order of lines.
    - Forward slash is no longer needed as plugin input or in the configured output directory. Thanks to using `File.join`.
    - Jekyll 4 fix - added `require "mini_magick"` to avoid a runtime error, as constant `MiniMagick::Image` was not defined.
    - Validation on plugin inputs as non-empty strings, to avoid later errors.
- Created this `README.md` file and the [docs](/docs/) directory.
- Created [demo](/demo/) directory as a site for local testing of the plugin.

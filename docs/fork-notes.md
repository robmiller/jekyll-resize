# Fork notes

This project was forked from the [CloudCannon/jekyll-resize](https://github.com/CloudCannon/jekyll-resize) repo ([jekyll-resize](https://rubygems.org/gems/jekyll-resize) on RubyGems). So that I could use this in my Jekyll 4 project and so others can too.


## Notable changes

- Updated [jekyll-resize.gemspec](/jekyll-resize.gemspec) to use Jekyll 4.
- Updated [jekyll-resize.rb](/lib/jekyll-resize.rb) file.
    - Reworded "Thumbnailing" to "Resizing", because this doesn't have to be used to make thumbnails (which are very small).
    - Reduced hash from 64 to 32 characters long.
    - Created functions to break up the logic.
    - Refactored variable names and order of lines.
    - Forward slash is no longer for the input path - so both `image.png` and `/image.png` are valid.
    - Added support for sites on a subpath - the `site.baseurl` is prepended now. Also, because of joining with `File.join`, the cache directory in the plugin code need doesn't to start with a forward slash anymore to work.
    - Jekyll 4 fix - added `require "mini_magick"` to avoid a runtime error, as constant `MiniMagick::Image` was not defined.
    - Validation on plugin inputs as non-empty strings, to avoid later errors.
- Created this `README.md` file and the [docs](/docs/) directory.
- Created [demo](/demo/) directory as a site for local testing of the plugin.

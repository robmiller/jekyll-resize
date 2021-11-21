require "digest"
require "mini_magick"

module Jekyll
  module Resize
    CACHE_DIR = "cache/resize/"
    HASH_LENGTH = 32

    # Generate output image filename.
    def _dest_filename(src_path, options, dest_dir)
      hash = Digest::SHA256.file(src_path)
      short_hash = hash.hexdigest()[0, HASH_LENGTH]
      options_slug = options.gsub(/[^\da-z]+/i, "")
      ext = File.extname(src_path)

      "#{short_hash}_#{options_slug}#{ext}"
    end

    # Build the path strings.
    def _paths(repo_base, img_path, options)
      src_path = File.join(repo_base, img_path)
      raise "Image at #{src_path} is not readable" unless File.readable?(src_path)

      dest_dir = File.join(repo_base, CACHE_DIR)

      dest_filename = _dest_filename(src_path, options, dest_dir)

      dest_path = File.join(dest_dir, dest_filename)
      dest_path_rel = File.join(CACHE_DIR, dest_filename)

      return src_path, dest_path, dest_dir, dest_filename, dest_path_rel
    end

    # Determine whether the image needs to be written.
    def _must_create?(src_path, dest_path)
      !File.exist?(dest_path) || File.mtime(dest_path) <= File.mtime(src_path)
    end

    # Read, process, and write out as new image.
    def _process_img(src_path, options, dest_path)
      image = MiniMagick::Image.open(src_path)

      image.strip
      image.resize options

      image.write dest_path
    end

    # Liquid tag entry-point.
    #
    # param source: e.g. "my-image.jpg"
    # param options: e.g. "800x800>"
    #
    # return dest_path_rel: Relative path for output file.
    def resize(source, options)
      raise "`source` must be a string - got: #{source.class}" unless source.is_a? String
      raise "`source` may not be empty" unless source.length > 0
      raise "`options` must be a string - got: #{options.class}" unless options.is_a? String
      raise "`options` may not be empty" unless options.length > 0

      site = @context.registers[:site]

      src_path, dest_path,dest_dir, dest_filename, dest_path_rel = _paths(site.source, source, options)

      FileUtils.mkdir_p(dest_dir)

      if _must_create?(src_path, dest_path)
        puts "Resizing '#{source}' to '#{dest_path_rel}' - using options: '#{options}'"

        _process_img(src_path, options, dest_path)

        site.static_files << Jekyll::StaticFile.new(site, site.source, CACHE_DIR, dest_filename)
      end

      File.join(site.baseurl, dest_path_rel)
    end
  end
end

Liquid::Template.register_filter(Jekyll::Resize)

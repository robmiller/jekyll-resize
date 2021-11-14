require 'digest'
require "mini_magick"

module Jekyll
  module Resize
    DEST_DIR = "cache/resize/"

    def _process_img(src_path, options, dest_path)
      image = MiniMagick::Image.open(src_path)

      image.strip
      image.resize options

      image.write dest_path
    end

    def _dest_filename(src_path, options, dest_dir)
      # Return value like '7f1f9026239...821410_800x800.jpg'

      hash = Digest::SHA256.file src_path
      img_slug = options.gsub(/[^\da-z]+/i, '')
      extension = File.extname(src_path)

      "#{hash}_#{img_slug}#{extension}"
    end

    def resize(source, options)
      site = @context.registers[:site]

      src_path = File.join(site.source, source)
      raise "#{src_path} is not readable" unless File.readable?(src_path)

      dest_dir = File.join(site.source, DEST_DIR)
      FileUtils.mkdir_p dest_dir

      dest_filename = _dest_filename(src_path, options, dest_dir)
      dest_path = File.join(dest_dir, dest_filename)

      if !File.exist?(dest_path) || File.mtime(dest_path) <= File.mtime(src_path)
        puts "Resizing #{src_path} to #{dest_path} (#{options})"

        _process_img(src_path, options, dest_path)

        site.static_files << Jekyll::StaticFile.new(site, site.source, DEST_DIR, dest_filename)
      end

      dest_path_relative = File.join(DEST_DIR, dest_filename)
    end
  end
end

Liquid::Template.register_filter(Jekyll::Resize)

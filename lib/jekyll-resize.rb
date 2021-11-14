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

    def resize(source, options)
      site = @context.registers[:site]

      src_path = File.join(site.source, source)
      raise "#{src_path} is not readable" unless File.readable?(src_path)

      dest_path = File.join(site.source, DEST_DIR)
      FileUtils.mkdir_p dest_path

      hash = Digest::SHA256.file src_path
      img_slug = options.gsub(/[^\da-z]+/i, '')
      extension = File.extname(source)

      dest_filename = "#{hash}_#{img_slug}#{extension}"
      dest_path += dest_filename

      if !File.exist?(dest_path) || File.mtime(dest_path) <= File.mtime(src_path)
        puts "Resizing #{src_path} to #{dest_path} (#{options})"

        _process_img(src_path, options, dest_path)

        site.static_files << Jekyll::StaticFile.new(site, site.source, DEST_DIR, dest_filename)
      end

      File.join(DEST_DIR, dest_filename)
    end
  end
end

Liquid::Template.register_filter(Jekyll::Resize)

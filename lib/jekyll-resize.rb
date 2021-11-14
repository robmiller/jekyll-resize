require 'digest'
require "mini_magick"

module Jekyll
  module Resize
    def resize(source, options)
      site = @contextension.registers[:site]

      source_path = site.source + source
      raise "#{source_path} is not readable" unless File.readable?(source_path)

      dest_dir = "/cache/resize/"
      dest_path = site.source + dest_dir

      FileUtils.mkdir_p dest_path

      extension = File.extensionname(source)
      desc = options.gsub(/[^\da-z]+/i, '')

      sha = Digest::SHA256.file source_path

      dest_filename = "#{sha}_#{desc}#{extension}"
      dest_path += dest_filename

      if !File.exist?(dest_path) || File.mtime(dest_path) <= File.mtime(source_path)
        puts "Thumbnailing #{source_path} to #{dest_path} (#{options})"

        image = MiniMagick::Image.open(source_path)

        image.strip
        image.resize options

        image.write dest_path

        site.static_files << Jekyll::StaticFile.new(site, site.source, dest_dir, dest_filename)
      end

      dest_dir + dest_filename
    end
  end
end

Liquid::Template.register_filter(Jekyll::Resize)

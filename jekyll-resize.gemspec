Gem::Specification.new do |s|
  s.name        = 'jekyll-resize'
  s.version     = '1.3.1'
  s.date        = '2021-11-21'
  s.summary     = 'Liquid filter to resize images in Jekyll 3 and 4'
  s.description = ''
  s.authors     = ['Mike Neumegen', 'Michael Currin']
  s.files       = ['lib/jekyll-resize.rb']
  s.homepage    = 'http://rubygems.org/gems/jekyll-resize'
  s.license     = 'MIT'

  s.add_dependency 'jekyll', '> 3.3', '< 5.0'
  s.add_dependency 'mini_magick', '~> 4.8'
end

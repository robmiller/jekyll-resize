Gem::Specification.new do |s|
  s.name        = 'jekyll-resize'
  s.version     = '0.0.0'
  s.date        = '2020-05-25'
  s.summary     = 'Liquid filter to resize images'
  s.description = ''
  s.authors     = ['Mike Neumegen', 'Michael Currin']
  s.files       = ['lib/jekyll-resize.rb']
  s.homepage    = 'http://rubygems.org/gems/jekyll-resize'
  s.license     = 'MIT'

  s.add_dependency 'jekyll', '~> 4.0'
  s.add_dependency 'mini_magick', '~> 4.8'
end

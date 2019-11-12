$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'workarea/slider_block/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'workarea-slider_block'
  s.version     = Workarea::SliderBlock::VERSION
  s.authors     = ['Ivana Veliskova', 'Jake Beresford']
  s.email       = ['iveliskova@weblinc.com', 'jberesford@weblinc.com']
  s.homepage    = 'https://github.com/workarea-commerce/workarea-slider-block'
  s.summary     = 'This will implement a customizable content block using slick slider'
  s.description = 'Simple rotating content block that allows several custom configuration options'

  s.files = `git ls-files`.split("\n")

  s.license = 'Business Software License'

  s.add_dependency 'workarea', '~> 3.x'
  s.add_dependency 'workarea-slick_slider', '>= 0.2.0'
end

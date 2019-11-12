require 'workarea/testing/teaspoon'

Teaspoon.configure do |config|
  config.root = Workarea::SliderBlock::Engine.root
  Workarea::Teaspoon.apply(config)
end

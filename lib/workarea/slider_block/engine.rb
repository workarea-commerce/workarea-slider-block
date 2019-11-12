module Workarea
  module SliderBlock
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::SliderBlock
    end
  end
end

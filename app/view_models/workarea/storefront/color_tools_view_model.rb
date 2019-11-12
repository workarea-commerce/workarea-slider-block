module Workarea
  module Storefront
    module ColorToolsViewModel
      def rgba(hex, alpha)
        if hex =~ /#(..)(..)(..)/
          "#{hex_to_rgb(hex)}, #{alpha_to_fraction(alpha)}"
        end
      end

      def alpha_to_fraction(alpha)
        alpha.to_f / 100.0
      end

      def hex_to_rgb(hex)
        r, g, b = hex.match(/#(..)(..)(..)/).captures
        "#{r.hex}, #{g.hex}, #{b.hex}"
      end
    end
  end
end

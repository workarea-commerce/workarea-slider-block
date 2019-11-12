module Workarea
  module Storefront
    module ContentBlocks
      class SliderBlockViewModel < ContentBlockViewModel
        include Workarea::Storefront::ColorToolsViewModel

        def content_block_options
          {
            options: {
              slidesToShow: 1,
              slidesToScroll: 1,
              autoplay: false, # mobile autoplay
              dots: data[:show_dots],
              arrows: data[:show_arrows],
              centerMode: data[:partial_slide_preview],
              pauseOnHover: data[:pause_on_hover],
              pauseOnDotsHover: data[:pause_on_hover],
              pauseOnFocus: data[:pause_on_hover],
              mobileFirst: true,
              responsive: [
                {
                  breakpoint: Workarea.config.storefront_break_points[:wide] - 1,
                  settings: {
                    autoplay: data[:auto_rotate],
                    autoplaySpeed: rotate_speed
                  }
                }
              ]
            },
            stopOnInteraction: data[:stop_on_interaction]
          }.to_json
        end

        def content_class
          content_class = ''
          data[:content_position].split(',').each_with_index do |pos, i|
            content_class << "slider-content-block__slide-content--#{pos.optionize}"
            unless i == 1
              content_class << ' '
            end
          end
          return content_class
        end

        def button_style_class
          classes = ['button']
          classes << 'button--large' if data[:button_style] == 'Large'
          classes << 'button--small' if data[:button_style] == 'Small'
          classes = ['text-button'] if data[:button_style] == 'Text Button'

          classes.join(' ')
        end

        def content_styles
          hex = data[:background_color]
          alpha = data[:background_alpha]

          "color: #{data[:text_color]}; background-color: rgba(#{rgba(hex, alpha)});"
        end

        def rotate_speed
          data[:auto_rotate_speed].to_f * 1000
        end
      end
    end
  end
end

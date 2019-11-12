require 'test_helper'
module Workarea
  module Storefront
    class ContentBlocks::SliderBlockViewModelTest < Workarea::SystemTest
      setup :set_view_model
      teardown :remove_image

      def set_view_model
        image = create_asset(name: 'Test Image', file_height: '400px', file_width: '400px')
        content = create_content
        block = content.blocks.create!(
          area: 'body',
          type_id: 'slider',
          data: {
            image_1: image.id,
            alt_tag_1: 'Image Alt',
            content_1: '<p>Test Content</p>',
            text_color_1: '#000000',
            background_color_1: '#ffffff',
            background_alpha_1: '50',
            button_text_1: 'Click Here',
            url_1: 'http://example.com',
            button_style_1: 'Regular',
            content_position_1: 'Middle, Center',
            image_2: image.id,
            alt_tag_2: 'Image Alt 2',
            content_2: '<p>Test Content 2</p>',
            text_color_2: '#ffffff',
            background_color_2: '#000000',
            background_alpha_2: '50',
            button_text_2: 'Click Here 2',
            url_2: 'http://example2.com',
            button_style_2: 'Text Button',
            content_position_2: 'Bottom, Right',
            show_dots: false,
            show_arrows: true,
            partial_slide_preview: false,
            auto_rotate: true,
            auto_rotate_speed: 3,
            pause_on_hover: true,
            stop_on_interaction: true
          }
        )

        @view_model = Storefront::ContentBlocks::SliderBlockViewModel.new(block)
      end

      def remove_image
        Workarea::Content::Asset.first.destroy
      end

      def test_locals_returns_additional_local_data_keys
        assert_equal('slider-content-block__slide-content--middle slider-content-block__slide-content--center', @view_model.series[0].content_class)
        assert_equal('slider-content-block__slide-content--bottom slider-content-block__slide-content--right', @view_model.series[1].content_class)
        assert_equal('button', @view_model.series[0].button_style_class)
        assert_equal('text-button', @view_model.series[1].button_style_class)
        assert_equal('color: #000000; background-color: rgba(255, 255, 255, 0.5);', @view_model.series[0].content_styles)
        assert_equal('color: #ffffff; background-color: rgba(0, 0, 0, 0.5);', @view_model.series[1].content_styles)
        assert_equal(3000, @view_model.rotate_speed)
      end

      def test_color_tools_module_methods
        hex = '#ffffff'
        alpha = 50
        assert_equal('255, 255, 255, 0.5', @view_model.rgba(hex, alpha))

        rgb = @view_model.hex_to_rgb('#ffffff')
        assert_equal('255, 255, 255', rgb)

        alpha = @view_model.alpha_to_fraction(75)
        assert_equal(0.75, alpha)
      end
    end
  end
end

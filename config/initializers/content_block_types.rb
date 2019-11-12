Workarea::Content.define_block_types do
  find_asset_id = lambda do |name|
    proc do
      asset = Workarea::Content::Asset.where(file_name: name).first ||
                Workarea::Content::Asset.placeholder
      asset.try(:id)
    end
  end

  block_type 'Slider' do
    description 'Adds a slider with images or text to your pages'
    view_model 'Workarea::Storefront::ContentBlocks::SliderBlockViewModel'

    series 5 do
      field 'Image', :asset, file_types: 'image', default: find_asset_id_by_file_name('960x470_light.png')
      field 'Alt Tag', :string
      field 'Content', :text, default: "<h2>Text</h2><p>#{Workarea.config.placeholder_text}</p>"
      field 'Text Color', :color, default: '#000000', presets: ['#000000', '#ffffff', '#999999', '#ff0000', '#00ff00', '#0000ff']
      field 'Background Color', :color, default: '#ffffff', presets: ['#000000', '#ffffff', '#999999', '#ff0000', '#00ff00', '#0000ff']
      field 'Background Alpha', :range, default: '50', min: 0, max: 100, step: 10
      field 'Button Text', :string, default: 'Button'
      field 'URL', :url, default: '/'
      field 'Button Style', :options, values: [
        'Regular',
        'Large',
        'Small',
        'Text Button'
      ], default: 'Regular'
      field 'Content Position', :options, values: [
        'Top, Left',
        'Top, Center',
        'Top, Right',
        'Middle, Left',
        'Middle, Center',
        'Middle, Right',
        'Bottom, Left',
        'Bottom, Center',
        'Bottom, Right'
      ], default: 'Middle, Center'
    end

    fieldset 'Options' do
      field 'Show Dots', :boolean, default: false
      field 'Show Arrows', :boolean, default: true
      field 'Partial Slide Preview', :boolean, default: false
      field 'Auto Rotate', :boolean, default: true
      field 'Auto Rotate Speed', :range, default: 4, min: 3, max: 6, step: 0.5, note: 'In seconds'
      field 'Pause on Hover', :boolean, default: true
      field 'Stop On Interaction', :boolean, default: true
    end
  end
end

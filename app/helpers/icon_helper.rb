module IconHelper
  def image_tag_for_brand
    if setting_for_brand_image.present?
      image_tag setting_for_brand_image, size: '30x30', class: 'd-inline-block align-bottom me-1', loading: 'lazy'
    else
      icon_tag :map, size: '30x30', class: 'd-inline-block align-top me-1', loading: 'lazy', fill: '#444'
    end
  end

  def icon_tag name, options = {}
    width, height = options[:size].split('x') if options[:size].present?
    options.merge! width: width, height: height

    # using bootstrap-icons-helper gem
    bootstrap_icon name, options
  end
end

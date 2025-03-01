module IconHelper
  def image_tag_for_brand
    if setting_for_brand_image.present?
      image_tag setting_for_brand_image, size: '32x32', class: 'me-2', loading: 'lazy'
    else
      icon_tag :map, size: '32x32', class: 'me-2', loading: 'lazy', fill: '#444'
    end
  end

  def icon_tag name, options = {}
    width, height = options[:size].split('x') if options[:size].present?

    width  ||= 30
    height ||= 30

    options.merge! width: width, height: height

    # using bootstrap-icons-helper gem
    bootstrap_icon name, options
  end
end

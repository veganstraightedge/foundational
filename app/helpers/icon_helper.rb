module IconHelper
  def image_tag_for_brand
    if setting_for_brand_image.present?
      image_tag setting_for_brand_image, size: '30x30', class: 'd-inline-block align-bottom mr-1', loading: 'lazy'
    else
      icon_tag :map, size: '30x30', class: 'd-inline-block align-top mr-1', loading: 'lazy'
    end
  end

  def icon_tag name, options = {}
    Icon.for name, options
  end
end

module IconHelper
  def image_tag_for_brand
    if setting_for_brand_image.present?
      tag.image setting_for_brand_image
    else
      icon_tag :map, size: "30x30", class: "d-inline-block align-top mr-1", loading: "lazy"
    end
  end

  def icon_tag name, options = {}
    Icon.for name, options
  end
end

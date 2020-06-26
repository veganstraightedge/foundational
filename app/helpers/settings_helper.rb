module SettingsHelper
  def setting_for_brand_name
    # TEMP: placeholder
    # TODO: roll into a Setting, with this as the fallback
    "When &amp; Where".html_safe
  end

  def setting_for_brand_image
    # TEMP: placeholder
    # TODO: roll into a Setting, with a Bootstrap icon fallback
    "https://getbootstrap.com/docs/4.5/assets/brand/bootstrap-solid.svg"
  end

end

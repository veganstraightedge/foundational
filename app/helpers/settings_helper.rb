module SettingsHelper
  def setting_for_site_locale
    Setting.for("default locale").content.html_safe
  end

  def setting_for_page_title
    [
      Setting.for("website name").content.html_safe,
      @page_title
    ].flatten.compact.join ' : '
  end

  def setting_for_brand_name
    Setting.for("website name").content.html_safe
  end

  def setting_for_brand_image
    # TEMP: placeholder
    # TODO: roll into a Setting, with a Bootstrap icon fallback
    'https://getbootstrap.com/docs/4.5/assets/brand/bootstrap-solid.svg'
  end
end

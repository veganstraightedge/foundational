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
    Setting.for("website header image").content&.html_safe
  end
end

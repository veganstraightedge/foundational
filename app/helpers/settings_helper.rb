module SettingsHelper
  SETTINGS_GROUP_ICON_MAP = {
    authentication: :lock,
    branding:       :image,
    localization:   :globe,
    profiles:       :person
  }.freeze

  def icon_for_settings_group name
    SETTINGS_GROUP_ICON_MAP[name.downcase.to_sym]
  end

  def setting_for_site_locale
    Setting.for('default locale').content.html_safe
  end

  def setting_for_page_title
    [
      Setting.for('website name').content.html_safe,
      @page_title
    ].flatten.compact.join ' : '
  end

  def setting_for_brand_name
    Setting.for('website name').content.html_safe
  end

  def setting_for_brand_image
    setting = Setting.for('website header image')

    url_for(setting.image) if setting.image.attached?
  end

  def on_settings_index?
    controller_name == 'settings' && action_name == 'index'
  end

  def on_setting? setting
    params[:id] == setting.id.to_s
  end
end

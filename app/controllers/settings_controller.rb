class SettingsController < ApplicationController
  before_action :set_grouped_settings
  before_action :set_setting,                  only: %i[edit update]
  before_action :set_setting_previous_content, only: :update

  def index
    @page_title = ['Site Settings']
  end

  def edit
    @page_title = ['Site Settings', 'Edit', @setting.name]
  end

  def update
    if @setting.update(setting_params)
      notice =  []
      notice << "Setting **“#{@setting.name}”** was successfully updated"
      notice << "from **“#{@setting_previous_content}”**"
      notice << "to   **“#{@setting.content}”**."
      notice =  notice.join(' ')

      redirect_to [:settings], notice: notice
    else
      render :edit
    end
  end

  private

  def set_setting
    @setting = Setting.find(params[:id])
  end

  def set_setting_previous_content
    @setting_previous_content = @setting.content
  end

  def set_grouped_settings
    @grouped_settings = Setting.order(group: :asc).group_by(&:group)
  end

  def setting_params
    params.expect(setting: %i[content image])
  end
end

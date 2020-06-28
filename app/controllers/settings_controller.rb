class SettingsController < ApplicationController
  before_action :authenticate_user!
  # TODO add admin user role check
  before_action :set_grouped_settings, only: %i[index edit]
  before_action :set_setting,          only: %i[edit update]

  def index
  end

  def edit
  end

  def update
    previous_content = @setting.content

    if @setting.update(setting_params)
      notice =  []
      notice << "Setting <b>“#{@setting.name}”</b> was successfully updated"
      notice << "from <b>“#{previous_content}”</b>"
      notice << "to   <b>“#{@setting.content}”</b>."
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

  def set_grouped_settings
    @grouped_settings = Setting.all.group_by(&:group)
  end

  def setting_params
    params.require(:setting).permit(:content)
  end
end

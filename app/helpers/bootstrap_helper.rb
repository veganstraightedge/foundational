module BootstrapHelper
  BOOTSTRAP_VERSION   = '5.3.7'.freeze
  BOOTSTRAP_INTEGRITY = 'sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr'.freeze

  def bootstrap_stylesheet_link_tag
    stylesheet_link_tag bootstrap_stylesheet_url,
                        integrity:   BOOTSTRAP_INTEGRITY,
                        crossorigin: 'anonymous',
                        data:        { turbo_track: 'reload' }
  end

  private

  def bootstrap_stylesheet_url
    "https://cdn.jsdelivr.net/npm/bootstrap@#{BOOTSTRAP_VERSION}/dist/css/bootstrap.min.css"
  end
end

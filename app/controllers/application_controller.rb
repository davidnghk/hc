class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end
 
	def set_locale
	  I18n.locale = params[:locale] || I18n.default_locale
	end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

end

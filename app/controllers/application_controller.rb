class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :confittgure_permitted_parameters, if: :devise_controller?
  # configure_permitted_parametersメソッドはdevise_controllerを用いる時しか処理しない

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end

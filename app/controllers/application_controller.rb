class ApplicationController < ActionController::Base
  # test
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name,:family_name_kana,:birth_day,:first_name_kana,:first_name])
  end
end
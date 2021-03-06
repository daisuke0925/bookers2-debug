class ApplicationController < ActionController::Base

  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # def after_sign_in_path_for(resource)
  #   admin_items_path
  # end

  def after_sign_out_path_for(resource)
    new_admin_session
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end

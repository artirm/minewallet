class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  layout :layout
    def isset_account
      #redirect_to root_path if user_signed_in?
    end

    def layout
      # only turn it off for login pages:
      if is_a?(Devise::SessionsController) or is_a?(Devise::RegistrationsController)
      "user"
      else
        "application"
      end
      # or turn layout off for every devise controller:
      #devise_controller? && "application"
    end

    def require_login
      unless devise_controller?
        redirect_to root_path unless user_signed_in?
      end
    end

end

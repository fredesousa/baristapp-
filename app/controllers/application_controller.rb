class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :navbar
  before_action :configure_permitted_parameters, if: :devise_controller?

  def navbar
    @favorites_count = Favorite.count
  end

    private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:level, :habit, :user_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:habit, :user_name])
    end
end

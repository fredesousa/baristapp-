class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :navbar
  before_action :configure_permitted_parameters, if: :devise_controller?

   # app/controllers/application_controller.rb

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def navbar
    @favorites_count = Favorite.count
  end

  def about
  end

    private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:level, :habit, :user_name, :photo])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:habit, :user_name, :photo])
    end
end

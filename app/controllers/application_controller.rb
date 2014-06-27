class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  config.assets.precompile += [
        'twitter/bootstrap/glyphicons-halflings.png',
        'twitter/bootstrap/glyphicons-halflings-white.png'
      ]

  def disable_container
    @disable_container = true
  end

  protect_from_forgery with: :exception
   before_filter :configure_permitted_parameters, if: :devise_controller?

protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
   devise_parameter_sanitizer.for(:account_update) << :name
   devise_parameter_sanitizer.for(:account_update) << :image
   devise_parameter_sanitizer.for(:account_update) << :description
 end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	ensure_security_headers
	before_action :configure_permitted_parameters, if: :devise_controller?

  include CommentsHelper
  include NestHelper
  include PostsHelper
=begin
  	def authenticate
	        authenticate_or_request_with_http_basic do |username, password|
			username == ENV['GMAIL_USERNAME'] && password == ENV['GMAIL_PASSWORD']
		end
	end
=end

	private

		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:account_update) { |u| 
				u.permit(:name, :email, :password, :password_confirmation, :current_password, :bio) 
			}
			devise_parameter_sanitizer.for(:sign_up) { |u| 
				u.permit(:name, :email, :password, :password_confirmation, :current_password, :bio) 
			}
		end
end

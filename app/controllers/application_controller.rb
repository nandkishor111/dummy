class ApplicationController < ActionController::Base
 # before_filter :authenticate_user!
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :contact_number, :city, :state, :address, :is_female, :date_of_birth, :user_role ) }
      
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :contact_number, :city, :state, :address, :is_female, :date_of_birth, :user_role,:password_confirmation, image_attributes:[:attachment]  ) }
    end

    def after_sign_in_path_for(user)
      posts_path
    end
    
   def after_sign_out_path_for(resource_or_scope)
     root_path
    end
  
end

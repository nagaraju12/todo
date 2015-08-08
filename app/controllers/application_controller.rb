class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_login?
    unless current_user
      redirect_to root_path
   end
  end



  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:email, :role, :password, :password_confirmation)
  end

def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      flash[:success] = "You have successfully logged in."
      if current_user.role == 'admin'
       products_path
      else
        session[:ss].present? ? session[:ss] : current_user.role != 'admin' ? '/products' : new_product_path(current_user)
      end
    end
  end

    

end

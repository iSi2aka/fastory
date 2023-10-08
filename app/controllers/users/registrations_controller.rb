class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    resource.update_without_password(user_params)
  end

  def after_update_path_for(resource)
    user_path(id: resource.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :department)
  end
end

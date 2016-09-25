class RegistrationsController < Devise::RegistrationsController

	# def create
 #    build_resource(registration_params)

 #    if resource.save
 #      if resource.active_for_authentication?
 #        set_flash_message :notice, :signed_up if is_navigational_format?
 #        sign_up(resource_name, resource)
 #        respond_with resource, :location => after_sign_up_path_for(resource)
 #      else
 #        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
 #        respond_with resource, :location => after_sign_up_path_for(resource)
 #      end
 #    else
 #      clean_up_passwords
 #      respond_with resource
 #    end
 #  end  

 #  private

 #  def registration_params
 #    params.require(:user).permit(:email, :title_id, :first_name, :last_name, 
 #      :province_id, :password, :password_confirmation)
 #  end

  # private

  # def sign_up_params
  #   params.require(:customer).permit(:username, :email, :password, :password_confirmation)
  # end

  # def account_update_params
  #   params.require(:customer).permit(:username, :last_name, :email, :password, :password_confirmation, :current_password)
  # end
end
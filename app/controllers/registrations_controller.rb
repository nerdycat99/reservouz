class RegistrationsController < Devise::RegistrationsController

  # after_action :sign_up_venue
  # before_action :testingtons

  # def testingtons
  #   puts "IN HERE NOW"
  #   # @user = User.new
  # end

  def create
    super
    flash.delete(:notice)
  end

  protected

  def sign_up_venue
    if resource.persisted? # user is created successfuly
      # resource.accounts.create(attributes_for_account)
      # redirect_to new_admin_venue_path
    end
  end

  # def create
  #   super
  #   redirect_to root_path
  # end

  # private

  # def sign_up_params
  #   @thisuser = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :venue_id, :state)  
  # end


  # def account_update_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  # end

  # def after_inactive_sign_up_path_for(users)
  #   puts "this fired - user created!!!!!"
  #   redirect_to new_admin_venue_path
  # end

  # def after_sign_in_path_for(users)
  # end

end

class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    # possible check for teacher pass code, need to have it to be a teacher
    # p "testingbar"
    # p params
    # p "testingpar"
    params.require(:user).permit(:is_teacher, :email, :password, :password_confirmation,:first_name,:last_name,:user_code)
  end

  def account_update_params
    params.require(:user).permit(:is_teacher, :email, :password, :password_confirmation, :current_password,:first_name,:last_name,:user_code)
  end
end
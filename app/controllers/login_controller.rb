class LoginController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to root_url
    else
      flash.now[:danger] = I18n.t "invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_user_path
  end
end

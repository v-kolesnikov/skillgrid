class Web::SessionsController < Web::ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email].downcase)
    if user && user.authenticate(user_params[:password])
      sign_in(user)
      redirect_to root_path
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end
end

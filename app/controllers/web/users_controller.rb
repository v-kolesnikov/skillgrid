class Web::UsersController < Web::ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :password)
  end
end

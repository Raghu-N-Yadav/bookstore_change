class RegistrationController < ApplicationController
  def index
    @user = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to see_books_path, notice: "Successfully created account"
    else
      # flash[:alert] = "Something went worng"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :confirm_password)
  end
end
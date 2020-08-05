class UsersController < ApplicationController

  def index
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def info
  	@user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(user)
    else
      @user = user
      render :edit
    end
  end
  private
  def user_params
   params.require(:user).permit(:name)
  end
end

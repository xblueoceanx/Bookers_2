class UsersController < ApplicationController
    before_action :authenticate_user!

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    #@user = User.find(current_user.id)
  end

  def show
    #@users = User.all
  	@user = User.find(params[:id])
  	@book = Book.new
    @books = @user.books
    #@book = Book.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
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
   params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

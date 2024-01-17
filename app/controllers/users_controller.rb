class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile_image = @user.get_profile_image(100, 100)
    @name = current_user.name
    @introduction = current_user.introduction
    @books = current_user.books
  end
  
  def index
  end

  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :email)
  end
end

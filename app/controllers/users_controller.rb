class UsersController < ApplicationController
  def show
    @user = User.new
    @profile_image = @user.profile_image
  end
  
  def index
  end

  def edit
  end
end

class UsersController < ApplicationController
 
 

 def new
    @user = User.new()
  end

 def show
    @user = User.find(params[:id])
  end

  def update
  end

  def create
    new_user = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user = User.new(new_user)
    if @user.save
        sign_in(@user)
        redirect_to(@user)
    else
        render :new
    end
  end

  def destroy
  end

  

end

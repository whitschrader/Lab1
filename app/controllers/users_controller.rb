class UsersController < ApplicationController
 
 def new
    @user = User.new()
  end

 def show
    @user = User.find(params[:id])

    @my_closet = @user.shoes
  end

  def update
  end

  def create #sign up action
    new_user = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user = User.new(new_user)
    if @user.save
        sign_in(@user)
        redirect_to(@user) #going to the routes, finding prefix 'user'
    else
        render :new
    end
  end

  def destroy
  end

  def search
  end
  

end

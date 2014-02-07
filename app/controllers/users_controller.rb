class UsersController < ApplicationController
  
  def match

    @potential_closet = []

    shoes_in_closet = current_user.shoes

    shoes_in_closet.each do |closet_shoe|
      matching_users = closet_shoe.users

      matching_users.each do |eachuser|
        matching_users_shoes = eachuser.shoes
        matching_users_shoes.each do |shoe|
          @potential_closet << shoe
        end 
      end
    end





    # #define those users that match the current shoe_id
    # user_matches = Connection.where('shoe_id =?', shoe_id)
    # user_to_shoes = {}
    # user_matches.each do |user|
    #   user_to_shoes[user.user_id] = User.find(user.user_id).shoes
    # end

    # take shoes of current user and match each against all closest
    # if there is a shoe that matches, then shoe all the shoes associated with this shoe



  end

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

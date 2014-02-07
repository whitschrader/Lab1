class UsersController < ApplicationController
  
  def match

    @potential_closet = []

    shoes_in_closet = current_user.shoes

    last_user  = nil
    matched_users_list = Hash.new(:excluded)
    last_shoe = nil
    matched_shoe_list = Hash.new(:excluded)

    shoes_in_closet.each do |closet_shoe|
      matching_users = closet_shoe.users
      matching_users.each do |eachuser|
        if(matched_users_list[eachuser] == :excluded) 
          matched_users_list[eachuser] = last_user
          last_user = eachuser

          matching_users_shoes = eachuser.shoes

          matching_users_shoes.each do |shoe|
            puts shoe
            if(matched_shoe_list[shoe] == :excluded)
              matched_shoe_list[shoe] = last_shoe
              last_shoe = shoe
            end
          end 
        end
      end
      @potential_closet = matched_shoe_list.keys
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
        #redirect_to(@user) #going to the routes, finding prefix 'user'
        redirect_to search_path
    else
        render :new
    end
  end

  def destroy
  end

  def search
  end
  

end

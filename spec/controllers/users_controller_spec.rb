require 'spec_helper'

# describe UsersController do

	describe "root" do
		describe "GET /" do
			it "should be successful" do
				get todos_path
				response.status.should == 200
			end
		end
	end
	

# 	describe "GET new" do
# 		before(:each) do
# 			@user = mock_model("User")
# 			allow(User).to receive(:new).and_return(@user)
# 			allow(User).to receive(:create)
# 		end

# 		it "should render :new template" do
# 			get :new
# 			expect(response). render_template("new")
# 		end

# 		it "should redirect to search_path" do
# 			expect(response).to redirect_to("/user/current_user")
# 		end

# 	describe "Post create" do

# 		it "should create a User" do
# 			user = mock_model("User")
# 			expect(User).to receive(:new)


# end


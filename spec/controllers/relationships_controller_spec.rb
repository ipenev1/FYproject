require 'spec_helper'

describe RelationshipsController do

	describe "access control" do
	
		it "should require sign-in for crate" do
			post :create
			response.should redirect_to(signin_path)
		end
		
		it "should require sign-in for destroy" do
			post :destroy, :id => 1
			response.should redirect_to(signin_path)
		end
	end
	
	describe "POST 'create'" do
	
		before(:each) do
			@user = test_sign_in(Factory(:user))
			@followed = Factory(:user, :email => Factory.next(:email))
		end
		
		it "should create a relationship" do
			lambda da
				post :create, :relationship => {:followed_id => @followed}
				response.should redirect_to(user_path(@followed))
			end.should change(Relationship, :count).by(1)
		end
		
		it "should create a relationship with ajax" do
			lambda do
				xhr :post, :create, :relationship => {:followed_id => @followed}
				response.should be_success
			end.should change(Relationship, :count).by(1)
		end
	end
	
	describe "DELETE 'destroy'" do
	
		before(:each) do
			@user = test_sign_in(Factory(:user))
			@followed = Factory(:user, :email => Factory.next(:email))
			@user.follow!(@follow)
			@relationship = @user.relationships.find_by_followed_id(@followed)
		end
		
		it "should destroy relationship" do
			lambda do
				delete :destroy, :id => @relationship
				response.should redirect_to(user_path(@followed))
			end.should change(Relationship, :count).by(-1)
		end
		
		it "should destroy a relationship with ajax" do
			lambda do
				xhr :delete, :destroy, :id => @relationship
				response.should be_success
			end.should change(Relationship, :count).by(-1)
		end
	end
end
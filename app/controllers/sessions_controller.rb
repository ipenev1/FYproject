class SessionsController < ApplicationController
  def new
	@title = "Sign in"
  end
  
  def create
	user = User.authenticate(params[:session][:email],
							 params[:session][:password])
	if user.nil?
		flash.now[:error] = "invalid email/password combination"
		@title = "Sign in"
		render 'new'
	else
	  #handle success
	end
  end
  
  def destroy
  
  end
end
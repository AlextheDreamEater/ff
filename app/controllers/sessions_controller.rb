class SessionsController < ApplicationController
  def new	
  end

  def create
  	user = User.find_by_userid(params[:user_id])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to root_path
  	else
  		render 'new', alert:
  		"User ID or Password is Wrong. Please try again."

		end
	end
	
	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	def index
	end
end

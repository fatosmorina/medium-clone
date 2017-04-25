class RelationshipsController < ApplicationController

	before_action :authenticate_user!

	def create
	  user = User.find(params[:user_id])
	  current_user.follow(user)
	  redirect_to user
	end

	def destroy
	end		

end
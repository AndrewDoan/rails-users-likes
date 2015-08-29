class LikesController < ApplicationController
	def create
		Like.create(user: current_user, secret: Secret.find(params[:secret_id]))
		redirect_to '/secrets'
	end

	def destroy
		like = Like.find_by(user: current_user, secret: Secret.find(params[:id]))
		like.destroy
		redirect_to '/secrets'
	end
end
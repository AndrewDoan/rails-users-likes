class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	def index
	end

	def new
	end

	def create
		user = User.create(email: params[:email], name: params[:name], password: params[:password])
		if user.errors.any?
			flash[:errors] = user.errors.full_messages
			redirect_to "/users/new"
		else
			redirect_to "/users/#{user.id}"
		end

	end

	def show
		@user = User.find(params[:id])
		@secrets = @user.secrets
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.email = params[:email]
		user.name = params[:name]
		user.save
		redirect_to "/users/#{user.id}"
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to '/sessions/new'
	end
end
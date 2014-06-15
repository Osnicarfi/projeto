class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@articles = @user.articles.page(params[:page]).per_page(20)		
	end

end
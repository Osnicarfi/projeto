class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@articles = @user.articles.page(params[:page]).per_page(20)		
	end

  def edit
    @user = User.find(params[:id])
  end

def update
   current_user.update(user_params)
   redirect_to user_path(current_user)
  
end

private
   def user_params
     params.require(:user).permit(:image, :description)
   end

end
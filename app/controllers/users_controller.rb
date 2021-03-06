class UsersController < ApplicationController

  def show
      @user=User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save  # if save to db succeed, then redirect to user_message page
      sign_in @user  # auto sign_in after sign_up
  		flash[:success] = "Welcome to the Follow_film App!"
  		redirect_to @user
  	else  # if save to db failed, reload signup page
  		render 'new'
  	end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @routes = @user.followed_routes.paginate(page: params[:page])
    render'show_follow'
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	
  end

end

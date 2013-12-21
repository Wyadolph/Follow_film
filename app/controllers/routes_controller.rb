class RoutesController < ApplicationController
	def followers
		@title = "Followers"
		@route = Route.find(params[:id])
		@users = @route.followers.paginate(page: params[:page])
		render 'show_follow'
	end

	def show
		 @route=Route.find(params[:id])
		 #@locations=Routes_locations.
		 # (User.find(route.user_id)).name
	end


end

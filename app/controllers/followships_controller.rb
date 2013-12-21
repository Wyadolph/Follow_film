class FollowshipsController < ApplicationController
	#before_action :signed_in_user
	include SessionsHelper

	def create
		@route = Route.find(params[:followship][:route_id])
		current_user.follow!(@route)
		redirect_to @route
	end

	def destroy
		@route = Followship.find(params[:id]).route
		current_user.unfollow!(@route)
		redirect_to showroute_path
	end
 
end

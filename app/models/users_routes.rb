class UsersRoutes < ActiveRecord::Base
	def setUserId(userid)
		self.user_id=userid
	end

	def setRouteId(routeid)
		self.route_id=routeid
	end

	def getUserId
		@id=self.user_id
	end
end

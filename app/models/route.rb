class Route < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :locations
	has_many :reverse_followships, foreign_key: "route_id", class_name: "Followship", dependent: :destroy
	has_many :followers, through: :reverse_followships, source: :user

	def addLocations(location)
		routeandlocation=RoutesLocations.new
		routeandlocation.setRouteId(self.id)
		routeandlocation.setLocationId(location.id)
		routeandlocation.save
		
	end

	def getId
		@id=self.id
	end

	def setUserId(userid)
		self.user_id=userid
		self.save!
	end

	def setRouteName(routename)
		self.name=routename
		self.save!
	end
end

class RoutesLocations < ActiveRecord::Base
	def setLocationId(locationid)
		self.location_id=locationid
	end
	def setRouteId(routeid)
		self.route_id=routeid
		
	end
end

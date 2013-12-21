module StaticPagesHelper
	
	def current_route=(route)
		@current_route=route
	end

	def addLocationTocurrentRoute(location)
		self.current_route.addLocations(location)
	end
end

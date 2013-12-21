class Film < ActiveRecord::Base
	has_many :sections
	has_and_belongs_to_many :users
	has_and_belongs_to_many :locations
	accepts_nested_attributes_for :locations

	def getLocation
		@location=[]
		@locationName=[]
        @loc=Location.new	
		filmsandlocation=FilmsLocations.all
		filmsandlocation.each do |t|
			if t.film_id==self.id
				@loc=Location.find(t.location_id)
				@locationName << @loc.name
				@location << t.location_id
			end
		end
		return @locationName
	end

	def getName
		@name=self.name
	end
end

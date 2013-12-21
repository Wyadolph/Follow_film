class Location < ActiveRecord::Base
	has_and_belongs_to_many :films
	belongs_to :route

	def getName
		@name=self.name
	end

	def setName(name)
		self.name=name
		self.save
	end
end

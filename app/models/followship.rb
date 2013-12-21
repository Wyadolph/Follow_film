class Followship < ActiveRecord::Base
	belongs_to :route, class_name: "Route"
	belongs_to :user, class_name: "User"
end

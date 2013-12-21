class User < ActiveRecord::Base
	has_and_belongs_to_many :routes
	has_and_belongs_to_many :films
	has_many :followships, foreign_key: "user_id", dependent: :destroy
	has_many :followed_routes, through: :followships, source: :route

  before_save { self.email = email.downcase }
  before_create :create_remember_token
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
	uniqueness: { case_sensitive: false }
	has_secure_password
	#validates :password, length: { minimum: 6 }
	validates :password_confirmation, presence: { :on => :create }
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def addRout(route)
		usersroutes=UsersRoutes.new
		usersroutes.setUserId(self.id)
		usersroutes.setRouteId(route.id)
		usersroutes.save
	end

	def getCurrentRoute
		@current_route=self.current_route_id
	end

	def setCurrentRoute(routeid)
		self.current_route_id=routeid
	end

	def getName
		@name=self.name
	end

	def getId
		@id=self.id
	end

	def following?(myroute)
		followships.find_by(route_id: myroute.id)
	end

	def follow!(myroute)
		followships.create!(route_id: myroute.id)
	end

	def unfollow!(myroute)
		followships.find_by(route_id: myroute.id).destroy
	end

	
	private

	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end


end

Class User

	attr_accessor :name, :email   #creates getters and setters for the attributes
	
	def initialize(attributes = {})
		@name = attributes[:name]
		@email = attributes[:email]
	end
	
	def formatted_email
		"#{@name} <#{@email}>"
	end
	
end
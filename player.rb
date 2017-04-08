require_relative 'game'

class Player
	attr_accessor :name
	attr_reader :health

	def initialize(name,health=100)
		@name = name.capitalize
		@health = health
	end
	def name=(new_name)
		@name = new_name.capitalize
	end

	def to_s
		"#{@name} with a health of #{@health} and a score of #{score}."
	end
	def score
		@health + @name.length	
	end

	def blamm
		@health -= 10
		puts "#{@name} got blammed! His health is now #{@health}"
	end

	def w00t
		@health += 15
		puts "#{@name} got w00ted. His health is now #{@health}"
	end	

end



if __FILE__ == $0
	player = Player.new("moe")
	puts player
	puts player.health
	player.w00t
	puts player.health
	player.blamm
	puts player.health
	puts player.name
	
end
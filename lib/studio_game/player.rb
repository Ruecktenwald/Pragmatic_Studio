
require_relative 'game'
require_relative 'playable'

module StudioGame
	class Player

		attr_accessor :name
		attr_accessor :health

		def initialize(name,health=100)
			@name = name.capitalize
			@health = health
			@found_treasure = Hash.new(0)
		end
		def self.from_csv(string)
			name, health = string.split(',')
			player = Player.new(name, Integer(health))
			
		end
		include Playable

		def found_treasure(treasure)
			@found_treasure[treasure.name] += treasure.points
			puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
			puts "#{@name} treasures: #{@found_treasure}"
		end
		def each_found_treasure
			@found_treasure.each do |name, points|
				yield Treasure.new(name, points)
			end
		end
		def points
			@found_treasure.values.reduce(0, :+)
		end
		def name=(new_name)
			@name = new_name.capitalize
		end

		def to_s
			"#{@name} with health = #{@health}, points = #{points}, and score = #{score}."
		end
		def score
			@health + points
		end
		def skip
			puts "Player has been skipped."
		end
		def <=>(other)
			other.score <=> score
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
end
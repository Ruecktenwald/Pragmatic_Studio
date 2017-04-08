require_relative 'die'

class Game
	  attr_reader :title
	  def initialize(title)
	  @title = title
	  @players = []
	  end

	  def add_player(a_player)
	  	@players << a_player
	  end

	  def play
	  	  puts "There are #{@players.size} in #{@title}"
	  	  @players.each do |player|
	  	  	puts player
	  		end


	  	  @players.each do |player|
	  	  	die = Die.new
	  	  	number_rolled = die.roll
		
	  		case number_rolled
	  			when 1..2
	  	 		player.blamm
	  	  		when 3..4
	  	  		puts "#{player.name} was skipped."
	  	  		else 5..6
	  	  		player.w00t
	  		end
	  		puts player
	  end

end
end
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
	  	  	puts "I'm #{player}"
	  		end

	  	  @players.each do |player|
	  	  		  player.w00t
	  	  		  player.blamm
	  	  		  player.w00t
	  	  		  puts player
	  	  end
	  	end
end


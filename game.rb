require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
class Game
	  attr_reader :title
	  def initialize(title)
	  @title = title
	  @players = []
	  end

	  def print_player_and_health(p)
	  	puts "#{p.name} (#{p.health})"
	  end

	  def print_stats
	  	strong_players, wimpy_players = @players.partition { |p| p.strong?}

	  	puts "\n#{@title} Statistics:"

	  	puts "\n#{strong_players.size} strong players:"
	  	strong_players.each do |p|
	  		print_player_and_health(p)
	  	end

	  	puts "\n#{wimpy_players.size} wimpy players:"
	  	wimpy_players.each do |p|
	  		print_player_and_health(p)
	  	end

	  	puts "\n#{@title} High Score:"
	  	@players.sort.each do |p|
	  		formatted_score = p.name.ljust(20, '.')
	  		puts "#{formatted_score} #{p.score}"
	  	end
	  end

	  def add_player(a_player)
	  	@players << a_player
	  end

	  def play(rounds)
	  	  puts "There are #{@players.size} in #{@title}"

	  	  @players.each do |player|
	  	  	puts player
	  		end

	  		treasures = TreasureTrove::TREASURES
	  		puts "\nThere are #{treasures.size} treasures:"
	  		treasures.each do |treasure|
			puts "A #{treasure.name} is worth #{treasure.points} points."	  			
	  		end

	  			

	  	  1.upto(rounds) do |round|
    	  puts "\nRound #{round}:"

	  	  

	  	  @players.each do |player|
	  	  	GameTurn.take_turn(player)
	  		# puts player

	  		end
	  end
	end
end
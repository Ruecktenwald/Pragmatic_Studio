require_relative 'die'
require_relative 'game_turn'
class Game
	  attr_reader :title
	  def initialize(title)
	  @title = title
	  @players = []
	  end

	  def print_stats
	  	strong_players, wimpy_players = @players.partition { |p| p.strong?}
	  
	  	puts "\n#{@title} Statistics:"

	  	puts "\n#{strong_players.size} strong players:"
	  	strong_players.each do |p|
	  		puts "\n#{p.name} (#{p.health})"

	  	end

	  	puts "\n#{wimpy_players.size} wimpy players:"
	  	wimpy_players.each do |p|
	  		puts "\n#{p.name} (#{p.health})"

	  	end


	  end

	  def add_player(a_player)
	  	@players << a_player
	  end

	  def play(rounds)
	  	  puts "There are #{@players.size} in #{@title}"

	  	  1.upto(rounds) do |round|
    	  puts "\nRound #{round}:"

	  	  @players.each do |player|
	  	  	puts player
	  		end

	  	  @players.each do |player|
	  	  	GameTurn.take_turn(player)
	  		# puts player

	  		end
	  end
	end
end
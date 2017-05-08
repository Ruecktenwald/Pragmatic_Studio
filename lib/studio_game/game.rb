require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'csv'

module StudioGame
	class Game
		  attr_reader :title
		  def initialize(title)
		  @title = title
		  @players = []
		  end
		  def high_score_entry(p)
		  		formatted_score = p.name.ljust(20, '.')
		  		"#{formatted_score} #{p.score}"
		  end
		  def save_high_scores(to_file="high_scores.txt")
		  	File.open(to_file, "w") do |file|
		  		file.puts "#{@title} High Scores:"
		  		@players.sort.each do |player|
		  		file.puts high_score_entry(player)
		  	  end
			end
		  end
		  def load_players(from_file)
		  	CSV.foreach(from_file) do |row|
		  		player = Player.new(row[0], row[1].to_i)
		  		add_player(player)
		  	end
		  end
		  def total_points
		  	@players.reduce(0) { |sum, player| sum + player.points}
		  end
		  def print_player_and_health(p)
		  	puts "#{p.name} (#{p.health})"
		  end

		  def print_stats
		  	strong_players, wimpy_players = @players.partition { |p| p.strong?}
		  	
		  	@players.each do |player|
		  		puts "\n#{player.name}'s point totals:"
		  		player.each_found_treasure do |treasure|
		  			puts "#{treasure.name} found worth #{treasure.points}"
		  		end
	  			puts "#{player.points} grand total points"
		  	end

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
		  		@players.sort.each do |player|
		  			puts high_score_entry(player)
		  		end

		  	
		  	puts "\nIn this game of #{@title}'s there were #{total_points} total treasure points."
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
end
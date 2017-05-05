require_relative 'player'
require_relative 'clumsy_player'
require_relative 'beserk_player'
# player1 = Player.new('moe')
# player2 = Player.new('larry',60)
# player3 = Player.new('curly',125)



knuckleheads = Game.new("Knuckleheads")
# knuckleheads.add_player(player1)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player3)
knuckleheads.load_players(ARGV.shift || "players.csv")

klutz = ClumsyPlayer.new('Klutz', 105)
crazy = BerserkPlayer.new('Crazy', 50)

knuckleheads.add_player(klutz)
knuckleheads.add_player(crazy)

loop do

	puts "\nHow many rounds shall we play? ('exit' to quit)"
	answer = gets.chomp.downcase
	puts "#{answer} rounds selected."

	case answer
	when /^\d+$/
		knuckleheads.play(answer.to_i)
	when 'quit', 'exit'
		knuckleheads.print_stats
		knuckleheads.total_points
		break
	else 
		puts "Please put a number or 'quit'."
	end
end
knuckleheads.save_high_scores
require_relative 'game'
require_relative 'die'
require_relative 'spec_helper'
require_relative 'player'
$stdout = StringIO.new


describe Game do 

		before do
			@game =Game.new('Knuckleheads')
		
			@initial_health = 100
			@player = Player.new("moe", @initial_health)

			@game.add_player(@player)
		end

		it "w00t player if 5 or 6 is rolled" do 
			# allow_any_instance_of(Die).to receive(:roll).and_return(5)

			@game.play
			# @player.w00t
			expect(@player.health).to eq(@initial_health + 15)
		end

		it "skip player if 3 or 4 is rolled" do 
			# allow_any_instance_of(Die).to receive(:roll).and_return(3)

			@game.play
			# @player.skip
			expect(@player.health).to eq(@initial_health)

		end

		it "Blamm player if 1 or 2 is rolled" do
			# allow_any_instance_of(Die).to receive(:roll).and_return(1)

			@game.play
			# @player.blamm
			expect(@player.health).to eq(@initial_health -10)

		end
end









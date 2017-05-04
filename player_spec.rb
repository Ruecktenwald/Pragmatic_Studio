require_relative 'player'
require_relative 'spec_helper'
require_relative 'treasure_trove'
$stdout = StringIO.new


describe Player do
	
	before do
		@initial_health = 50
		@player = Player.new('larry', @initial_health)

	end

	it "has capatilized name" do
		@player

		expect(@player.name).to eq("Larry")
		# player.name.should == 'Larry'
	end

	it "has an initial health" do
		@player

		expect(@player.health).to eq(@initial_health)
	end

	it "has a string representation" do
	  @player.found_treasure(Treasure.new(:hammer, 50))
	  @player.found_treasure(Treasure.new(:hammer, 50))

	  @player.to_s.should == "Larry with health = 50, points = 100, and score = 150."
	end

	it "computes a score as the sum of its health and points" do
		  @player.found_treasure(Treasure.new(:hammer, 50))
		  @player.found_treasure(Treasure.new(:hammer, 50))

		  @player.score.should == 150
	end

	it "plus 15 when w00ted" do
		@player.w00t
		expect(@player.health).to eq(@initial_health + 15)
	end

	it 	"minus 10 when blammed" do
		@player.blamm
		expect(@player.health).to eq(@initial_health - 10)

	end
	
	it "computes points as the sum of all treasure points" do
	  @player.points.should == 0

	  @player.found_treasure(Treasure.new(:hammer, 50))

	  @player.points.should == 50

	  @player.found_treasure(Treasure.new(:crowbar, 400))

	  @player.points.should == 450

	  @player.found_treasure(Treasure.new(:hammer, 50))

	  @player.points.should == 500
    end

it "yields each found treasure and its total points" do
  @player.found_treasure(Treasure.new(:skillet, 100))
  @player.found_treasure(Treasure.new(:skillet, 100))
  @player.found_treasure(Treasure.new(:hammer, 50))
  @player.found_treasure(Treasure.new(:bottle, 5))
  @player.found_treasure(Treasure.new(:bottle, 5))
  @player.found_treasure(Treasure.new(:bottle, 5))
  @player.found_treasure(Treasure.new(:bottle, 5))
  @player.found_treasure(Treasure.new(:bottle, 5))

  yielded = []
  @player.each_found_treasure do |treasure|
    yielded << treasure
  end

  yielded.should == [
    Treasure.new(:skillet, 200),
    Treasure.new(:hammer, 50),
    Treasure.new(:bottle, 25)
 ]
end
it "can be created from a CSV string" do
  player = Player.from_csv("larry,150")

  player.name.should == "Larry"
  player.health.should == 150
end

context "health greater than 100" do
		before do
		@player = Player.new('jim', 150)
		end

		it "is strong" do
			expect(@player).to be_strong
		end
	end
context "health less than 100" do
		before do
		@player = Player.new('joy', 100)
		end
		
		it "is wimpy" do
		expect(@player).not_to be_strong
		end

	end

context "in collection of players" do
	before do
		@player1 = Player.new("sal", 100)
		@player2 = Player.new("gro", 200)
		@player3 = Player.new("moe", 300)

		@players = [@player1, @player2, @player3]
		end

		it "sort by descending order" do
			expect(@players.sort).to eq([@player3, @player2, @player1])
		end
	end
end










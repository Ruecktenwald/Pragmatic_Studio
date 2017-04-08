require_relative 'player'
require_relative 'spec_helper'
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
		@player 
		expect(@player.to_s).to eq("Larry with a health of 50 and a score of 55.")
	end

	it "computes a score as the sum of its health and length of name" do
		@player

		expect(@player.score).to eq(@player.health + @player.name.length)
	end

	it "plus 15 when w00ted" do
		@player.w00t
		expect(@player.health).to eq(@initial_health + 15)
	end

	it 	"minus 10 when blammed" do
		@player.blamm
		expect(@player.health).to eq(@initial_health - 10)

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


end









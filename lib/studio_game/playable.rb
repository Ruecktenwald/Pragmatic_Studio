module StudioGame
	module Playable

		def blamm
			self.health -= 10
			puts "#{name} got blammed! His health is now #{health}"
		end

		def w00t
			self.health += 15
			puts "#{name} got w00ted. His health is now #{health}"
		end	
		def strong?
			health > 100
		end
	end
end
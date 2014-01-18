class Zombie < ActiveRecord::Base

	has_one :brain, :dependent => :destroy

	before_save :make_rotting

	def make_rotting
		if age < 20 
			self.rotting = false
		else 
			self.rotting = true
		end
	end

end

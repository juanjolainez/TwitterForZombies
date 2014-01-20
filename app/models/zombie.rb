class Zombie < ActiveRecord::Base

	has_one :brain, :dependent => :destroy
	has_many :assignments
	has_many :tweets
	has_many :roles, through: :assignments
	# before_save :make_rotting

	# def make_rotting
	# 	if age < 20 
	# 		self.rotting = false
	# 	else 
	# 		self.rotting = true
	# 	end
	# end

end

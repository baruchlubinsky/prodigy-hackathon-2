class DummyController < ApplicationController
	def student
		render json: {
			facebook: {
				criteria1: random,
				criteria2: random,
				criteria3: random,
			},
			twitter: {
				criteria1: random,
				criteria2: random,
				criteria3: random,
			},
			linkedin: {
				criteria1: random,
				criteria2: random,
				criteria3: random,
			},
		}
	end

	private
	def random
		exists = rand(100) < 80
		if exists
			return rand(100).to_s + "%"
		else
			return "Unavailable"
		end
	end
end
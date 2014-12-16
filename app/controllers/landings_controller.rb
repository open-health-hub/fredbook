class LandingsController < ApplicationController

	def index
		if current_user
			redirect_to medical_events_url
		end
	end

end
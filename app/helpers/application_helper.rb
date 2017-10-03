module ApplicationHelper
	def sport_name(sport_id)
		Sport.find(sport_id).title
	end
end

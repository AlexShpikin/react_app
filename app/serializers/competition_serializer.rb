class CompetitionSerializer < ActiveModel::Serializer
  	attributes :id, :title, :sportsmans_count, :results

  	def sportsmans_count
		object.relationships.count
	end
	
	def results
		object.relationships.pluck(:result)
	end
end

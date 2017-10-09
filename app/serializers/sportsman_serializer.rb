class SportsmanSerializer < ActiveModel::Serializer
  	attributes :id

  	def all_results
  		#object.relationships.
  		#ActiveModel::Serializer::CollectionSerializer.new(@competitions, each_serializer: CompetitionSerializer)
  	end
  	
end

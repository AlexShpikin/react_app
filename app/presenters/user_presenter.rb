class UserPresenter < BasePresenter
	
	def sportsman
		@model
	end

	def competitions
		Competition.all.as_json(only: [:id, :title])
	end

	def results
		ActiveModel::Serializer::CollectionSerializer.new(self.sportsman.relationships, each_serializer: RelationshipSerializer)
	end

end
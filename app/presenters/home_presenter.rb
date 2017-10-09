class HomePresenter < BasePresenter

	def sports
		@model.all
	end

	def data
		ActiveModel::Serializer::CollectionSerializer.new(self.sports, each_serializer: SportSerializer)
	end

end	
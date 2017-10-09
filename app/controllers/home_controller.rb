class HomeController < ApplicationController
  
  def index
  	@sports = Sport.all
    @data = ActiveModel::Serializer::CollectionSerializer.new(@sports, each_serializer: SportSerializer)
  end
  
  def load
    @competitions = Sport.find(params[:index]).competitions
    render json: ActiveModel::Serializer::CollectionSerializer.new(@competitions, each_serializer: CompetitionSerializer)
  end

end

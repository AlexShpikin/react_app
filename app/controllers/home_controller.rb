class HomeController < ApplicationController
  
  def index
  	@sports = Sport.all
    @data = ActiveModel::Serializer::CollectionSerializer.new(@sports, each_serializer: SportSerializer)
  end
  
  def load
    @sport = Sport.find(params[:index])
    render :json => @sport, :serializer => SportSerializer 
  end

end

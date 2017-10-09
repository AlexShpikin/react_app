class HomeController < ApplicationController
  
  def index
   	@present = HomePresenter.new(Sport, view_context)
  end
  
  def load
    @competitions = Sport.find(params[:index]).competitions
  
    respond_to do |format|
    	format.html {redirect_to root_path}
    	format.json {render json: ActiveModel::Serializer::CollectionSerializer.new(@competitions, each_serializer: CompetitionSerializer)}
    end
  end

end

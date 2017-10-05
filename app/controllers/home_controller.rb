class HomeController < ApplicationController
  def index
  	@sports = Sport.all
  	@data = @sports.map{|s| {:title=>s.title, :sportsmans=>s.sportsmans.count, :competitions=>s.competitions.count}}
  end
  def load
  	render :json => {
      :data => Sport.find(params[:index]).competitions.as_json(only: [:title], methods: :competitions),
      :points => Sport.find(params[:index]).competitions.as_json(only: [:title], methods: :results)
    }
  end
end

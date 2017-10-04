class HomeController < ApplicationController
  def index
  	@sports = Sport.all
  	@data = @sports.map{|s| {:title=>s.title, :sportsmans=>s.sportsmans.count, :competitions=>s.competitions.count}}
  end
  def load
  	@result = Array.new
  	@points = Array.new
    # NOTE: здесь нужно отдавать сериализованые объекты модели.
    #  для этого можно использовать либо jbuilder, либо гем Serializer (предпочтительнее), либо тупо метод to_json
    #  кроме того, это все абсолютно не читабельно
  	@points.push(Sport.find(params[:index]).competitions.map.with_index{|s, i| {:x=>i, :y=>s.relationships.pluck(:result).inject(0){|sum, i| sum+i}/s.relationships.count}})
  	@points.push(Sport.find(params[:index]).competitions.map.with_index{|s, i| {:x=>i, :y=>s.relationships.pluck(:result).max}})
  	@result.push(:data=>Sport.find(params[:index]).competitions.map{|s| {:title=>s.title, :competitions=>s.relationships.count}}, :linedata=>{:points=>@points, :xValues=>(0..Sport.find(params[:index]).competitions.count).to_a, :yMin=>0, :yMax=>Relationship.all.pluck(:result).max})
  	render json: @result
  end
end

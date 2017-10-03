class SportsmansController < ApplicationController
	def new
		@sportsman = Sportsman.new
	end

	def show
		@points = Array.new
		@pointsList = Array.new
		@sportsman = Sportsman.find(params[:id])
		@competitions = Competition.all
		
		@pointsList.push(@sportsman.relationships.map.with_index{|s, i| {:x=>i, :y=>s.result}})
		@pointsList.push(@sportsman.relationships.map.with_index{|s, i| {:x=>i, :y=>Relationship.where(competition_id:s.competition_id).pluck(:result).max}})
		@pointsList.push(@sportsman.relationships.map.with_index{|s, i| {:x=>i, :y=>Relationship.where(competition_id:s.competition_id).pluck(:result).inject(0){|sum, i| sum+i}/Relationship.where(competition_id:s.competition_id).count}})
		@points.push({:points=>@pointsList, :xValues=>(0..@sportsman.relationships.count).to_a, :yMin=>0, :yMax=>Relationship.all.pluck(:result).max})
		puts @points 
	end

	def index
		@sportsmans = Sportsman.all
	end

	def edit
		@sportsman = Sportsman.find(params[:id])
		@sports = sports_list		
	end

	def create
		@sportsman = Sportsman.new(sportsman_params)
		if @sportsman.save
			redirect_to user_path(User.find(@sportsman.user_id))
		else
			render 'new'
		end		
	end

	def update
	    @sportsman = Sportsman.find(params[:id])
	    if @sportsman.update_attributes(sportsman_params)
	      redirect_to @sportsman
	    else
	      render 'edit'
	    end
	end

	def destroy
		Sportsman.find(params[:id]).destroy
		redirect_to sportsmans_url
	end
	 def load
	 	render json: Competition.find(params[:index]).relationships.order(:place).map{|r| {:name=>Sportsman.find(r.sportsman_id).name, :sername=>Sportsman.find(r.sportsman_id).sername, :result=>r.result, :place=>r.place}}
	end
	private
		def sportsman_params
			params.require(:sportsman).permit(:name, :sername, :sport_id, :user_id)
		end
end

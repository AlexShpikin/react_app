class CompetitionsController < ApplicationController
	def index
		@competitions = Competition.all
	end

	def new 
		@competition = Competition.new
		@sports = sports_list
	end
	
	def show
		@competition = Competition.find(params[:id]) 
	end
	
	def create
		@competition = Competition.new(competition_params)
		if @competition.save
			redirect_to @competition
		else
			render 'new'
		end	
	end
	def edit
		@competition = Competition.find(params[:id])
		@sports = sports_list
	end

	def update
	    @competition = Competition.find(params[:id])
	    if @competition.update_attributes(competition_params)
	      redirect_to @competition
	    else
	      render 'edit'
	    end
	end

	def destroy
		Competition.find(params[:id]).destroy
		redirect_to competitions_url
	end
	
	private
	  	def competition_params
	  		params.require(:competition).permit(:title, :date, :sport_id)
	  	end
end
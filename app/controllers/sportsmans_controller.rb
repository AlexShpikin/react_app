class SportsmansController < ApplicationController
	def new
		@sportsman = Sportsman.new
	end

	def show
		@sportsman = Sportsman.find(params[:id])
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
		@results = Relationship.where(competition_id: params[:index]).order(:place)
		
		respond_to do |format|
			format.html {redirect_to root_path}
			format.json { render json: ActiveModel::Serializer::CollectionSerializer.new(@results, each_serializer: SportsmanSerializer) }
		end	
	end

	private
		def sportsman_params
			params.require(:sportsman).permit(:name, :sername, :sport_id, :user_id)
		end
end

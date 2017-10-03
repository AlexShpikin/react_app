class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @sportsman = Sportsman.find_by(:user_id=>@user.id)
    @points = Array.new
    @pointsList = Array.new
    @sportsman = Sportsman.find(params[:id])
    @competitions = Competition.all
    
    @pointsList.push(@sportsman.relationships.map.with_index{|s, i| {:x=>i, :y=>s.result}})
    @pointsList.push(@sportsman.relationships.map.with_index{|s, i| {:x=>i, :y=>Relationship.where(competition_id:s.competition_id).pluck(:result).max}})
    @pointsList.push(@sportsman.relationships.map.with_index{|s, i| {:x=>i, :y=>Relationship.where(competition_id:s.competition_id).pluck(:result).inject(0){|sum, i| sum+i}/Relationship.where(competition_id:s.competition_id).count}})
    @points.push({:points=>@pointsList, :xValues=>(0..@sportsman.relationships.count).to_a, :yMin=>0, :yMax=>Relationship.all.pluck(:result).max})
    
  end

  def new
  	@user = User.new
  	@roles = Role.all.map{ |c| [c.title, c.id] }
  end
  def new_sportsman
  	@user = User.find(params[:id])
	@sports = sports_list		
  end
  def create_sportsman
  	@sportsman = Sportsman.new(sportsman_params)
	if @sportsman.save
		redirect_to User.find(@sportsman.user_id)
	else
		render 'new_sportsman'
	end	
  end
  def create
    @user = User.new(user_params) 
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  private
  	def user_params
  		params.require(:user).permit(:login, :role, :password, :password_confirmation)
  	end
  	def sportsman_params
		params.require(:users).permit(:name, :sername, :sport_id, :user_id)
	end
end

class RolesController < ApplicationController
	def new
		@role = Role.new
	end

	def create
		if Role.find_by(title: params[:title]).blank?
			if Role.new(role_params).save
				#redirect_to @role
				render layout: false
			else
				render 'new'
			end	
		else
			flash[:error] = 'Такой пользователь уже есть'
			render 'new'
		end	
	end

	def show
		#render layout: false
		#@role = Role.find(params[:id])
	end



	private
		def role_params 
			params.require(:role).permit(:title)
		end	
end
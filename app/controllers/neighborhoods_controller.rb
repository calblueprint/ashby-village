class NeighborhoodsController < ApplicationController
	def index
		@neighborhoods = Neighborhood.all
	end

	def new
		@neighborhood = Neighborhood.new
	end

	def create
		@neighborhood = Neighborhood.create(neighhorhood_params)

		if @neighborhood.save
		   @neighborhood.group.create(name: params[:name])
			redirect_to index
		else
			render "new"
		end 
	end 

	def neighhorhood_params
		params.require(:neighborhood).permit(:name)
	end

end

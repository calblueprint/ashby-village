class NeighborhoodsController < ApplicationController
	def index
		@neighborhoods = Neighborhood.all
	end

	def show
		@neighborhood = Neighborhood.find params[:id]
	end

	def new
		@neighborhood = Neighborhood.new
	end

	def create
		@neighborhood = Neighborhood.new(neighhorhood_params)
		if @neighborhood.save
			@neighborhood.groups.create(name:  @neighborhood.title + " Announcements") #ADD A GENERIC DESCRIPTION ONCE MERGED W NIKITA'S FILES

			redirect_to action: "index"
		else
			render 'new'
		end
	end

	def neighhorhood_params
		params.require(:neighborhood).permit(:title, :description, :location)
	end
end

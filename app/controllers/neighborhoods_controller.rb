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
		   @neighborhood.groups.create(name: "Announcements for " + @neighborhood.title)
			redirect_to action: "index"
		else
			render "new"
		end 
	end 

	def neighhorhood_params
		params.require(:neighborhood).permit(:title, :text, :location)
	end

	def nh_announcements
		params.require(:neighborhood).permit(:title)
	end

end

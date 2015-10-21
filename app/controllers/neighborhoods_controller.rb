class NeighborhoodsController < ApplicationController
	def index
		@neighborhoods = Neighborhood.all
	end

	def new
		@neighborhood = Neighborhood.new
	end

	def contains_title?(title)
		@neighborhoods = Neighborhood.all
		@neighborhoods.each do |item|
			if item.title == title
				return true
			end
		end
		return false	
	end

	def create
		@neighborhood = Neighborhood.new
		@repeat_error = contains_title?(neighhorhood_params[:title])
		if @repeat_error
		   render "new"

		else 
		   @neighborhood = Neighborhood.create(neighhorhood_params)
		   @neighborhood.groups.create(name:  @neighborhood.title + " Announcements") #ADD A GENERIC DESCRIPTION ONCE MERGED W NIKITA'S FILES
		   redirect_to action: "index"
		end 
	end 

	def neighhorhood_params
		params.require(:neighborhood).permit(:title, :description, :location)
	end

	def nh_titles
		params.require(:neighborhood).permit(:title)
	end

end

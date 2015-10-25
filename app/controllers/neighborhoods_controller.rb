class NeighborhoodsController < ApplicationController
	def index
		@neighborhoods = Neighborhood.all
	end

	def new
		@neighborhood = Neighborhood.new
	end

	def create

		if true
		   @neighborhood = Neighborhood.new(neighhorhood_params)
		   if @neighborhood.save
		      @neighborhood.groups.create(name:  @neighborhood.title + " Announcements") #ADD A GENERIC DESCRIPTION ONCE MERGED W NIKITA'S FILES

		      redirect_to action: "index"
		   else
		      render 'new'
		   end
		end
	end

	def neighhorhood_params
		params.require(:neighborhood).permit(:title, :description, :location)
	end

	def nh_titles
		params.require(:neighborhood).permit(:title)
	end

end

class NeighborhoodsController < ApplicationController
	def index
		@neighborhoods = Neighborhood.all
	end

	def show
		@neighborhood = Neighborhood.find(params[:id])
	end

	def create
	end 


end

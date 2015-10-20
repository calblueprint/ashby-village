class PagesController < ApplicationController
  def groups
  	@data = Group.first
  end
end

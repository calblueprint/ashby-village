class AdddGroupRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :group, index: true
  end
end

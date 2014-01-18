class RemoveRatingToZombies < ActiveRecord::Migration
  def change
    remove_column :zombies, :rating, :boolean
  end
end

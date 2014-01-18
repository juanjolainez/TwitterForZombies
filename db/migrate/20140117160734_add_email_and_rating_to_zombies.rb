class AddEmailAndRatingToZombies < ActiveRecord::Migration
  def change
    add_column :zombies, :email, :string
    add_column :zombies, :rating, :boolean
  end
end

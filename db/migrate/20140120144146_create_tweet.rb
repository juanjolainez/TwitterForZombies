class CreateTweet < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :zombie_id
      t.string :text
    end
  end
end

class CreateRole < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
    end
  end
end

class CreateHappyHours < ActiveRecord::Migration[5.2]
  def change
    create_table :happy_hours do |t|
      t.string :date
      t.string :food
      t.string :drink
      t.string :friends
      t.float :rating
      t.integer :user_id
      t.integer :location_id
    end
  end
end

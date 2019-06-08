class AddLocationColumnToHappyHours < ActiveRecord::Migration[5.2]
  def change
    add_column :happy_hours, :location, :string
  end
end

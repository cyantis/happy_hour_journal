class RemoveLocationColumnFromHappyHours < ActiveRecord::Migration[5.2]
  def change
    remove_column :happy_hours, :location
  end
end

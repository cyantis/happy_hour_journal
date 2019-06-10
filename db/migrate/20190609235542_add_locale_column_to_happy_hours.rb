class AddLocaleColumnToHappyHours < ActiveRecord::Migration[5.2]
  def change
    add_column :happy_hours, :locale, :string
  end
end

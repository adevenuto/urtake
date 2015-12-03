class AddMethodOfContactToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :url, :string
    add_column :places, :phone_number, :string
  end
end

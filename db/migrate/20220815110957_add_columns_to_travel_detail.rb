class AddColumnsToTravelDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :travel_details, :from_latlng, :string
    add_column :travel_details, :to_latlng, :string
  end
end

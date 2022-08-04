class AddColumnToTravelDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :travel_details, :going_by, :string
  end
end

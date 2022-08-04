class CreateTravelDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :travel_details do |t|
      t.string :to
      t.string :from
      t.string :capacity
      t.datetime :departure_time
      t.datetime :arrival_time
      t.string :additional_message
      t.references :user

      t.timestamps
    end
  end
end

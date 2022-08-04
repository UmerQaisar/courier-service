class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :package_details
      t.string :weight
      t.references :travel_detail
      t.references :user

      t.timestamps
    end
  end
end

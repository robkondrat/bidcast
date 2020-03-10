class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.decimal :price, precision: 7, scale: 2
      t.integer :advertiser_id
      t.integer :space_id

      t.timestamps
    end
  end
end

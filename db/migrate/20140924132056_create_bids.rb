class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :max_bid
      t.timestamps
    end
  end
end

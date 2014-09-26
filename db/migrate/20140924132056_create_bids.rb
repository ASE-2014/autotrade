class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :max_bid
      t.references :auction, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

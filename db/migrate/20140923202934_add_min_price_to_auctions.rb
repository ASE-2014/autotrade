class AddMinPriceToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :price, :decimal, precision: 10, scale: 2
  end
end

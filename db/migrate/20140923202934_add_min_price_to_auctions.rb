class AddMinPriceToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :min_price, :decimal, precision: 10, scale: 2
  end
end
class RenameColumnMinPriceToStartPrice < ActiveRecord::Migration
  def change
    rename_column :auctions, :min_price, :start_price
  end
end

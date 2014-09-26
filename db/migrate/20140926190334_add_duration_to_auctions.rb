class AddDurationToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :duration, :integer
  end
end

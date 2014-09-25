class Bid < ActiveRecord::Base
  belongs_to :auctioner
  belongs_to :bidder
  validates :max_bid, presence: true
end

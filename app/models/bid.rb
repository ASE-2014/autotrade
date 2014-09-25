class Bid < ActiveRecord::Base
  belongs_to :article
  belongs_to :bidder
  validates :max_bid, presence: true
end

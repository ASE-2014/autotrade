class Auction < ActiveRecord::Base
  has_many :bids
  belongs_to :auctioner
  validates :title, presence: true, length: {minimum: 3}
  validates :description, presence: true
  validates_numericality_of :price
  def update_price
    if (bids.count > 1)
      ordered_bids = bids.sort_by{ |b| b.max_bid }.reverse
      ordered_bids.shift # removes current top bid from ordered_bids
      second_highest_bid = ordered_bids.first
      self.price = second_highest_bid.max_bid + 1
      self.save
    end
  end
end

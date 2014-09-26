class Auction < ActiveRecord::Base

  has_many :bids
  belongs_to :user

  validates :title, presence: true, length: {minimum: 3}
  validates :description, presence: true
  validates_numericality_of :price

  def update_price
    # the current top price for an auction is the first possible bid that
    # overbids that second highest max_bid, unless there is only one bid
    # in which case the current top price does not change and the user to
    # bid first is still the current winner.
    if (bids.count > 1)
      ordered_bids = bids.sort_by{ |b| b.max_bid }.reverse
      highest_bid = ordered_bids.shift # also removes current top bid from ordered_bids
      second_highest_bid = ordered_bids.first

      # only adjust price if two highest bids aren't equal
      if (highest_bid!=second_highest_bid)
        self.price = second_highest_bid.max_bid + 1
        self.save
      end
    end
  end

  def self.search(query)
    where("title like ? OR description like ?", "%#{query}%", "%#{query}%")
  end

end

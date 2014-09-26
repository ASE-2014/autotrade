class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user

  validates :max_bid, presence: true
  validates :auction_id, presence: true
  validates :user_id, presence: true
  validates :max_bid, :numericality => { :greater_than_or_equal_to => 1 }

end

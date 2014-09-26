class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user

  validates :max_bid, presence: true
  validates :max_bid, :numericality => { :greater_than_or_equal_to => 0 }

end

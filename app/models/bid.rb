class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user
  validates :max_bid, presence: true
end

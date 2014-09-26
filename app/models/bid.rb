class Bid < ActiveRecord::Base
  belongs_to :auctioner
  belongs_to :user
  validates :max_bid, presence: true
end

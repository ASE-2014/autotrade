class Bid < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates :max_bid, presence: true
end

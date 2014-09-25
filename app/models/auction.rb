class Auction < ActiveRecord::Base
  has_many :bids
  belongs_to :auctioner
  validates :title, presence: true, length: {minimum: 3}
  validates :description, presence: true
  validates_numericality_of :start_price
end

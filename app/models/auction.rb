class Auction < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 3}
  validates :description, presence: true
  validates_numericality_of :start_price
end

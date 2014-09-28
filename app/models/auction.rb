class Auction < ActiveRecord::Base

  has_many :bids
  belongs_to :user

  validates :title, presence: true, length: {minimum: 3}
  validates :description, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 1 }


  def refresh
    # the current top price for an auction is the first possible bid that
    # overbids that second highest max_bid, unless there is only one bid
    # in which case the current top price does not change and the user to
    # bid first is still the current winner.
    if !is_first_bid?
      update_price
    end
    # as per requirements, auctions must be extended by 15 mins if a bid
    # is made within the last 5 mins of an auction
    if less_mins_remaining_than? 5
      extend_duration_by_mins 15
    end
    self.save
  end

  def update_price
    ordered_bids = bids.sort_by{ |b| b.max_bid }.reverse
    highest_bid = ordered_bids.shift # also removes highest_bid from ordered_bids
    second_highest_bid = ordered_bids.first
    # increment second highest max_bid by 1 if two highest bids aren't equal
    if highest_bid.max_bid!=second_highest_bid.max_bid
      self.price = second_highest_bid.max_bid + 1
    else #
      self.price = second_highest_bid.max_bid
    end
  end

  def self.search(query)
    where("title like ? OR description like ?", "%#{query}%", "%#{query}%")
  end

  def extend_duration_by_mins mins
    self.duration += mins
  end

  def has_no_bids?
    self.bids.empty?
  end

  def is_first_bid?
    self.bids.count <= 1
  end

  def less_mins_remaining_than? n
    (((self.created_at + self.duration*60) - Time.now) - (n*60)) < 0
  end

<<<<<<< HEAD
=======
  def time_remaining
    (self.created_at + self.duration*60) - Time.now
  end

  def time_remaining_string
    self.running? ? (self.hours_remaining_string + ":" + self.minutes_remaining_string + ":" + self.seconds_remaining_string) : "Auction finished."
  end

  def hours_remaining
    ((self.time_remaining/3600).floor).to_s
  end

  def minutes_remaining
    (((self.time_remaining%3600)/60).floor).to_s
  end

  def seconds_remaining
    ((self.time_remaining%60).floor).to_s
  end

  def hours_remaining_string
    self.hours_remaining.length==1 ? ("0"+self.hours_remaining) : self.hours_remaining
  end

  def minutes_remaining_string
    self.minutes_remaining.length==1 ? ("0"+self.minutes_remaining) : self.minutes_remaining
  end

  def seconds_remaining_string
    self.seconds_remaining.length==1 ? ("0"+self.seconds_remaining) : self.seconds_remaining
  end

  def running?
    self.time_remaining>0
  end

>>>>>>> feature/bootstrap
  def tweets
    options = {count: 6, result_type: 'recent'}
    $twitter.search(self.title, options).take(6) #somehow the count argument doesn't work...
  end
end

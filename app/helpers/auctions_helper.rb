module AuctionsHelper
  # formats a duration in seconds to hh:mm:ss
  def format_duration seconds
    Time.at(seconds).utc.strftime("%H:%M:%S")
  end

end

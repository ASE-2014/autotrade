module AuctionsHelper
  # formats a duration in seconds to hh:mm:ss
  def format_duration seconds
    Time.at(seconds).utc.strftime("%H:%M:%S")
  end

  def format_duration_if_pos seconds
    if seconds > 0
      format_duration(seconds)
    else
      "Auction closed."
    end
  end

end

module AuctionsHelper
  # formats a duration in seconds to hh:mm:ss
  def format_duration seconds
    hours = (seconds/3600).floor
    minutes = ((seconds%3600)/60).floor
    seconds = (seconds%60).floor
    (hours < 10 ? "0" + hours.to_s : hours.to_s) + ":" + (minutes < 10 ? "0" + minutes.to_s : minutes.to_s) + ":" + (seconds  < 10 ? "0" + seconds.to_s : seconds.to_s)
  end

  def format_duration_if_pos seconds
    if seconds > 0
      format_duration(seconds)
    else
      "Auction closed."
    end
  end

end

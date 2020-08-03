require_relative 'session'

class MorningSession < Session

  def initialize(year, month, day)
    start_time = Time.local(year, month, day, 9)
    end_time = Time.local(year, month, day, 12)
    super("Morning", start_time, end_time)
  end
end
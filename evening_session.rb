require_relative 'session'

class EveningSession < Session

  def initialize(year, month, day)
    start_time = Time.local(year, month, day, 13)
    end_time = Time.local(year, month, day, 17)
    super("Evening", start_time, end_time)
  end
end
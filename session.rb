require_relative 'talk'

class Session

  def initialize(name, start_time, end_time)
    @name = name
    @start_time = start_time
    @end_time = end_time
    @talks = []
    @available_minutes = (end_time.to_i - start_time.to_i) / 60
  end

  def add_talk(talk)
    return false if can_add_talk(talk) == false

    @talks << talk
    @available_minutes -= talk.minutes

    return true
  end

  def timetable
    result = "#{@name} session time-table\n"
    talk_start_time = @start_time
    @talks.each do |talk| 
        result += "\n#{talk_start_time.strftime("%I:%M %p")} #{talk}"
        talk_start_time += (talk.minutes * 60)
    end

    return result
  end

  def can_add_talk(talk)
    return talk.minutes <= @available_minutes
  end
end
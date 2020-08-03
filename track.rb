require_relative 'session'

class Track

  def initialize(name)
    @name = name
    @sessions = []
  end

  def add_session(session)
    @sessions << session
  end

  def timetable
    result = "TRACK #{@name}\n\n"
    @sessions.each { |session| result += "#{session.timetable}\n\n" }

    return result
  end
end
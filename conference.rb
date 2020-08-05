require_relative 'track'
require_relative 'talk'
require_relative 'lightning_talk'
require_relative 'session'
require_relative 'morning_session'
require_relative 'evening_session'

class Conference

  def initialize()
    @tracks = []
    @pending_talks = []
  end

  def load_talks(talks)
    if (talks.nil? || talks.empty?)
      puts "No talks available"
      return
    end

    talks_sorted = talks.sort_by { |talk| talk.minutes }

    lightning_talks, long_talks = talks_sorted.partition { |talk| talk.is_a? LightningTalk }

    day, month, year = 2020, 1, 1

    track_1_morning_session = MorningSession.new(day, month, year)
    until lightning_talks.empty?
      talk = lightning_talks.first
      if track_1_morning_session.add_talk(talk)
        lightning_talks.delete(talk)
      else
        break
      end
    end

    until long_talks.empty?
      talk = long_talks.first
      if track_1_morning_session.add_talk(talk)
        long_talks.delete(talk)
      else
        break
      end
    end

    track_1_evening_session = EveningSession.new(day, month, year)
    until long_talks.empty?
      talk = long_talks.first
      if track_1_evening_session.add_talk(talk)
        long_talks.delete(talk)
      else
        break
      end
    end

    track_1 = Track.new("1")
    track_1.add_session(track_1_morning_session)
    track_1.add_session(track_1_evening_session)
    @tracks << track_1

    track_2_morning_session = MorningSession.new(day, month, year)
  
    until long_talks.empty?
      talk = long_talks.first
      if track_2_morning_session.add_talk(talk)
        long_talks.delete(talk)
      else
        break
      end
    end

    track_2_evening_session = EveningSession.new(day, month, year)
    while !(long_talks.empty?)
      talk = long_talks.first
      if track_2_evening_session.add_talk(talk)
        long_talks.delete(talk)
      else
        break
      end
    end

    track_2 = Track.new("2")
    track_2.add_session(track_2_morning_session)
    track_2.add_session(track_2_evening_session)
    @tracks << track_2

    @pending_talks += lightning_talks unless lightning_talks.empty? 
    @pending_talks += long_talks unless long_talks.empty?
  end

  def timetable
    result = ""
    @tracks.each { |track| result += track.timetable }

    unless @pending_talks.empty?
      result += "PENDING TALKS\n\n"
      @pending_talks.each { |talk| result += "#{talk}\n"}
    end

    return result
  end
end
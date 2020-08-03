require_relative 'conference'
require_relative 'constants'

conference = Conference.new
conference.load_talks(Constants::TALKS)
puts conference.timetable

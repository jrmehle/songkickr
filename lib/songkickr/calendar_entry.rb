module Songkickr
  class CalendarEntry
    attr_accessor :reason, :event, :created_at

    def initialize(calendar_entry_hash = {})
      @created_at = calendar_entry_hash['createdAt']
      @event      = Event.new calendar_entry_hash['event']
      @reason     = parse_reason(calendar_entry_hash['reason'])
    end

    protected

      def parse_reason(entry_reason = {})
        if entry_reason.include? 'trackedArtist'
          # trackedArtist is an array of artists
          entry_reason['trackedArtist'].map { |artist| Artist.new artist }
        elsif entry_reason.include? 'attendance'
          # attendance is a string i_might_go | im_going
          entry_reason['attendance']
        end
      end
  end
end

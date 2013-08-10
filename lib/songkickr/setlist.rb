module Songkickr
  #   A single set list by an artist.
  #
  #   {
  #     "displayName": "N.E.R.D. at Glastonbury Festival 2009",
  #     "artist": {
  #       "uri": "http://www.songkick.com/artists/387012-nerd?utm_source=791&utm_medium=partner"
  #       "identifier": [
  #         {
  #           "href": "http://api.songkick.com/api/3.0/artists/mbid:3fb49f5a-fdc0-4789-9c84-22b38b3f3cb5.json"
  #           "mbid": "3fb49f5a-fdc0-4789-9c84-22b38b3f3cb5"
  #         }
  #       ]
  #       "displayName": "N.E.R.D."
  #       "id": 387012
  #     },
  #     "id": 9511,
  #     "setlistItem": []
  #   }
  class Setlist
    attr_accessor :setlist_items, :artist, :playlist_uri, :display_name, :id

    # Takes the setlist hash and parses out an Event and Artist and an array of SetlistItems.
    def initialize(setlist_hash)
      @setlist_items = parse_setlist_items setlist_hash["setlistItem"]
      @artist        = Songkickr::Artist.new setlist_hash["artist"]
      @playlist_uri  = setlist_hash["playlistUri"]
      @display_name  = setlist_hash["displayName"]
      @id            = setlist_hash["id"]
    end

    protected

      # Takes the array of setlist items and create SetLists
      def parse_setlist_items(setlist_item_array = nil)
        return [] unless setlist_item_array
        setlist_item_array.inject([]) do |setlist_items, item|
          setlist_items << Songkickr::SetlistItem.new(item)
        end
      end
  end
end

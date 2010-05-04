module Songkickr
  class Setlist
    attr_accessor :event, :setlist_items, :artist, :playlist_uri, :display_name, :id
    
    def initialize(setlist_hash)
      @event         = Songkickr::Event.new setlist_hash["event"]
      @setlist_items = parse_setlist_items setlist_hash["setlistItem"]
      @artist        = Songkickr::Artist.new setlist_hash["artist"]
      @playlist_uri  = setlist_hash["playlistUri"]
      @display_name  = setlist_hash["displayName"]
      @id            = setlist_hash["id"]
    end
    
    protected
      
      def parse_setlist_items(setlist_item_array = nil)
        setlist_items = []
        if setlist_item_array
          setlist_item_array.each do |item|
            setlist_items << Songkickr::SetlistItem.new(item)
          end
        end
        
        setlist_items
      end
  end
end

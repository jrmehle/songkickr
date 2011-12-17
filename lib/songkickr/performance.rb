module Songkickr
  # A single performance by an artist.
  #   {
  #     "artist": {
  #       "uri": "http://www.songkick.com/artists/288696-vampire-weekend",
  #       "displayName": "Vampire Weekend",
  #       "id": 288696,
  #       "identifier": [{"mbid": "af37c51c-0790-4a29-b995-456f98a6b8c9"}]
  #     }
  #     "displayName": "Vampire Weekend",
  #     "billingIndex": 1,
  #     "id": 5380281,
  #     "billing": "headline"
  #   }
  class Performance
    attr_accessor :artist, :display_name, :id, :billing_index, :billing

    # Takes a the hash of the performance. Parses out an Artist object for the artist.
    def initialize(performance_hash)
      @artist        = Songkickr::Artist.new performance_hash["artist"]
      @display_name  = performance_hash["displayName"]
      @id            = performance_hash["id"]
      @billing_index = performance_hash['billingIndex']
      @billin        = performance_hash['billing']
    end
  end
end

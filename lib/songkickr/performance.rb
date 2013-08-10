module Songkickr
  # A single performance by an artist.
  # {
  #   billingIndex: 2,
  #   billing: "headline",
  #   displayName: "A Day to Remember",
  #   artist: {
  #     identifier: [
  #       {
  #         href: "http://api.songkick.com/api/3.0/artists/mbid:db008806-16f6-48fc-8521-3d953709689d.json",
  #         mbid: "db008806-16f6-48fc-8521-3d953709689d"
  #       }
  #     ],
  #     displayName: "A Day to Remember",
  #     uri: "http://www.songkick.com/artists/470482-a-day-to-remember?utm_source=4791&utm_medium=partner",
  #     id: 470482
  #   },
  #   id: 34045929
  # }
  class Performance
    attr_accessor :artist, :display_name, :id, :billing_index, :billing

    # Takes a the hash of the performance. Parses out an Artist object for the artist.
    def initialize(performance_hash)
      @artist        = Songkickr::Artist.new performance_hash["artist"]
      @display_name  = performance_hash["displayName"]
      @id            = performance_hash["id"]
      @billing_index = performance_hash['billingIndex']
      @billing       = performance_hash['billing']
    end
  end
end

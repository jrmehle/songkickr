module Songkickr
  module RemoteApi
    module SimilarArtists
      # ==== Similar Artists
      # Returns an array of Artists similar to a given artist, based on tracking and attendance data
      #
      # https://www.songkick.com/developer/similar-artists
      def similar_artists(artist_id)
        result = get("/artists/#{artist_id}/similar_artists.json")
        Songkickr::ArtistResult.new result
      end
    end
  end
end

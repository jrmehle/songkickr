module Songkickr
  module RemoteApi
    module Performances
      # ==== Artist performances
      # Returns an array of Performances.
      #
      # ex. remote.artist_performances('mbid:5bac9b4f-2f1c-4d39-8d11-231d5b6650ce', page: 1, per_page: 5, order: 'desc')
      #
      # https://groups.google.com/d/msg/songkick-api/-miIGjIc5IE/vYV6n0o8AQAJ (still in beta)
      #
      # === Parameters
      # * +artist_id_or_music_brainz_id+ - Songkick unique ID for artist. Use artist_search to find an artist ID. Or a MusicBrainz.org id string. ex. mbid:5bac9b4f-2f1c-4d39-8d11-231d5b6650ce
      # * +query+ - A hash of query parameters, see below for options.
      #
      # ==== Query Parameters
      # * +page+ - Page number
      # * +per_page+ - Number of results per page, max 50.
      # * +order+ - Results are sorted by date. The order can be specified with: order ('asc' or 'desc', 'asc' by default).
      def artist_performances(artist_id_or_music_brainz_id, query = {})
        if artist_id_or_music_brainz_id.to_s.match(/^mbid\:\d+$/)
          url = "/artists/mbid:#{artist_id_or_music_brainz_id}/calendar/performances.json"
        else
          url = "/artists/#{artist_id_or_music_brainz_id}/calendar/performances.json"
        end

        result = get(url, query: query)
        Songkickr::PerformanceResult.new result
      end
    end
  end
end

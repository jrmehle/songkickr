require 'rubygems'
gem 'httparty'
require 'httparty'

dir = File.dirname(__FILE__)
require dir + '/songkickr/performance'
require dir + '/songkickr/artist'
require dir + '/songkickr/location'
require dir + '/songkickr/location_result'
require dir + '/songkickr/venue'
require dir + '/songkickr/event'
require dir + '/songkickr/setlist_item'
require dir + '/songkickr/setlist'
require dir + '/songkickr/event_result'
require dir + '/songkickr/concert_setlist_result'
require dir + '/songkickr/remote'
require dir + '/songkickr/artist_result'

class APIKeyNotSet < StandardError;
  # Warns of missing API key
  def to_s
    'API key not set!'
  end
end

module Songkickr
  # Returns the Songkick API key
  # In order to use the Songkick API, you must have a Songkick API (their rule, not mine).
  # Get an API key for your app from http://developer.songkick.com/
  #
  # ==== Example
  #
  #   require 'songkickr'
  #   remote = Songkickr::Remote.new XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  #   remote.api_key
  #   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  def self.api_key
    raise APIKeyNotSet if @api_key.nil?

    @api_key
  end

  # Set the API key. In the event you need to set the API key after initializing the the remote.
  # === Parameters
  #
  # * +api_key+ - A developer key from Songkick. Get an API key for your app from http://developer.songkick.com/
  def self.api_key=(api_key)
    @api_key = api_key
  end
end

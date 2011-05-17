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
  def to_s
    'API key not set!'
  end
end

module Songkickr
  
  # Get your API key from http://developer.songkick.com/
  def self.api_key
    raise APIKeyNotSet if @api_key.nil?

    @api_key
  end

  def self.api_key=(api_key)
    @api_key = api_key
  end
end

require 'rubygems'
gem 'httparty'
require 'httparty'

dir = File.dirname(__FILE__)
require dir + '/songkickr/artist'
require dir + '/songkickr/venue'
require dir + '/songkickr/event'
require dir + '/songkickr/result'
require dir + '/songkickr/remote'

class APIKeyNotSet < StandardError; end

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

class Hash
  
  # Converts all of the keys to strings, optionally formatting key name
  def rubyify_keys!
    keys.each{|k|
      v = delete(k)
      new_key = k.to_s.underscore
      self[new_key] = v
      v.rubyify_keys! if v.is_a?(Hash)
      v.each{|p| p.rubyify_keys! if p.is_a?(Hash)} if v.is_a?(Array)
    }
    self
  end
end

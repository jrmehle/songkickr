require 'spec_helper'
require 'songkickr/remote'

describe Songkickr::Remote do
  it "should raise an error if no API key is set" do
    lambda { Songkickr::Remote.new }.should raise_error(APIKeyNotSet)
  end

  it "should not raise an error if an API key is set" do
    lambda { Songkickr::Remote.new('124abc') }.should_not raise_error(APIKeyNotSet)
  end

  it "should assign the api_key for later retrieval" do
    expected = '123abc'
    remote   = Songkickr::Remote.new(expected)

    remote.api_key.should == expected
  end

  describe "given an invalid resource" do
    before(:each) do
      FakeWeb.register_uri(:get, 'http://api.songkick.com/api/3.0/events/123.json?apikey=omgwtfbbq_fake_key', :body => fixture_file('resource_not_found.json'))
      FakeWeb.register_uri(:get, 'http://api.songkick.com/api/3.0/venues/123.json?apikey=omgwtfbbq_fake_key', :body => fixture_file('resource_not_found.json'))
      @remote = Songkickr::Remote.new 'omgwtfbbq_fake_key'
    end

    it "raise an ResouceNotFound exception when search a songkick event id doesn't exist" do
      lambda { @remote.event(123) }.should raise_error(ResouceNotFound)
    end

    it "raise an ResouceNotFound exception when search a songkick venue id doesn't exist" do
      lambda { @remote.venue(123) }.should raise_error(ResouceNotFound)
    end
  end

  describe "given a remote with an invalid api key" do
    before(:each) do
      stub_get('http://api.songkick.com/api/3.0/events.json', 'events.json')
      @remote = Songkickr::Remote.new 'omgwtfbbq_fake_key'
    end

    it "should generate a remote" do
      @remote.should_not be_nil
    end
  end
end

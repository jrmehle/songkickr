require 'spec_helper'
require 'songkickr/artist'

describe Songkickr::Artist do
  before(:all) do
    @expected = { 'uri'         => 'http://www.songkick.com/artists/253846-radiohead',
                  'displayName' => 'Some Name',
                  'id'          => 1234,
                  'onTourUntil' => 'some date' }
    @artist = Songkickr::Artist.new @expected
  end

  it "should be able to be initialized" do
    @artist.uri.should           == @expected['uri']
    @artist.display_name.should  == @expected['displayName']
    @artist.id.should            == @expected['id']
    @artist.on_tour_until.should == @expected['onTourUntil']
  end
end

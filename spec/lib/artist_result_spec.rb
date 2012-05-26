require 'spec_helper'
require 'songkickr/artist_result'

describe Songkickr::ArtistResult do
  before(:all) do
    @expected      = { 'resultsPage' => { 'page' => '1', 'totalEntries' => '1', 'results' => { 'artist' => [{'uri' => 'http://www.www.com', 'displayName' => 'Some Name', 'id' => 1234, 'onTourUntil' => 'some date'}] } } }
    @artist_result = Songkickr::ArtistResult.new @expected
  end

  it "should be able to be initialized" do
    @artist_result.should_not be_nil
    @artist_result.page.should          == @expected['resultsPage']['page']
    @artist_result.total_entries.should == @expected['resultsPage']['totalEntries']
    @artist_result.results.should_not be_nil
  end

  it "should parse results" do
    @artist_result.results.size.should == @artist_result.total_entries.to_i
    @artist_result.results.each do |artist|
      artist.class.should == Songkickr::Artist
    end
  end
end

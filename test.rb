#!/usr/bin/env ruby
# This is a simple comand line test to make sure everything is working

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'songkickr'
require 'httparty'


remote = Songkickr::Remote.new 'hFYxiInE4DBpH5KL'
@results = remote.artist_search(:query => "Muse", :per_page=>'10' ).results
@results.each do |result|
  print result.display_name + "\n"
end

print "\n"

@gigography_results = remote.gigography(@results[0].id, :per_page=>'50', :page=>'1', :min_date=>'2010-01-01').results

@gigography_results.each do |gig|
  print gig.display_name + "\n"
end

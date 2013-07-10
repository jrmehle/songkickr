require 'test/unit'
require 'shoulda'
require 'fakeweb'

require 'crack'

FakeWeb.allow_net_connect = false


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'songkickr'

class Test::Unit::TestCase
end

def songkick_url(url)
  url =~ /^http/ ? url : "http://api.songkick.com/api/3.0#{url}"
end

def fixture_file(filename)
  return "" if filename == ""
  file_path = File.expand_path(File.dirname(__FILE__) + "/fixtures/" + filename)
  File.read(file_path)
end

def fixture_hash(filename)
  Crack::JSON.parse(fixture_file(filename))
end

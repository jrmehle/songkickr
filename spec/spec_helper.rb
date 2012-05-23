require 'songkickr'
require 'fakeweb'

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

def stub_get(url, filename, status = nil)
  options = {:body => fixture_file(filename)}
  options.merge!({:status => status}) unless status.nil?
  FakeWeb.register_uri(:get, songkick_url(url), options)
end

def stub_post(url, filename)
  FakeWeb.register_uri(:post, songkick_url(url), :body => fixture_file(filename))
end

def stub_put(url, filename)
  FakeWeb.register_uri(:put, songkick_url(url), :body => fixture_file(filename))
end

def stub_delete(url, filename)
  FakeWeb.register_uri(:delete, songkick_url(url), :body => fixture_file(filename))
end

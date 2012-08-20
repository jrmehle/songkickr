require 'vcr'

VCR.config do |c|
  c.stub_with :fakeweb
  c.cassette_library_dir = 'test/fixtures/vcr'
  c.default_cassette_options = { :record => :new_episodes }
end

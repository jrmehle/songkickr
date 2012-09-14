require 'vcr'

VCR.configure do |c|
  c.hook_into :fakeweb
  c.cassette_library_dir = 'test/fixtures/vcr'
  c.default_cassette_options = { :record => :new_episodes }
end

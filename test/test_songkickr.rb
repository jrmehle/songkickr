require 'helper'

class TestSongkickr < Test::Unit::TestCase
  should "have an api key if one is passed in" do
    s = Songkickr
    key = s.api_key = '123abc'

    assert_not_nil s.api_key
  end
end

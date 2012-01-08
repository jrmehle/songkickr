require 'helper'

class TestSetlistItem < Test::Unit::TestCase
  context "Given a new SetlistItem" do
    setup do
      @name         = 'Tour Setlist'
      @setlist_item = Songkickr::SetlistItem.new({'encore' => 0, 'name' => @name})
    end

    should "init encore" do
      assert_not_nil @setlist_item
      assert !@setlist_item.encore
    end

    should "init name" do
      assert_not_nil @setlist_item
      assert_equal @name, @setlist_item.name
    end
  end
end

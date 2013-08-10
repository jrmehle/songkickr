module Songkickr
  # A single set list item.
  #    {
  #      encore: 0
  #      name: "Anti Matter "
  #    }
  class SetlistItem
    attr_accessor :encore, :name
    
    # Takes the set list item hash and parses a boolean out for encore.
    def initialize(setlist_item_hash)
      @encore = !setlist_item_hash["encore"].zero?
      @name   = setlist_item_hash["name"]
    end
  end
end

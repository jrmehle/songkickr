module Songkickr
  class SetlistItem
    attr_accessor :encore, :name
    
    def initialize(setlist_item_hash)
      @encore = !!setlist_item_hash["encore"]
      @name   = setlist_item_hash["name"]
    end
  end
end

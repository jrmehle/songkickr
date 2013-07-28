module Songkickr
  # "tracking": {
  #   "username": "username",
  #   "id": "artist:231185",
  #   "createdAt": "2010-04-17T17:27:45Z",
  #   "attendance": "i_might_go"
  # }
  class Tracking
    attr_accessor :attendance, :created_at, :id, :username

    def initialize(tracking_hash)
      @attendance = tracking_hash["attendance"] if tracking_hash.include? "attendance"
      @id         = tracking_hash["id"]
      @username   = tracking_hash["username"]
      @created_at = tracking_hash["created_at"]
    end
  end
end

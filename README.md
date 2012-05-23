# songkickr

A Ruby wrapper around the Songkick API. Visit www.songkick.com/developer for documentation on the Songkick API.

# Install Instructions

 gem install songkickr

or if your environment requires

 sudo gem install songkickr

# Usage Instructions

    require 'songkickr'
    remote = Songkickr::Remote.new API_KEY

Then call events, users_events(username), or concert_setlists(event_id)

    results = remote.events(:artist_name => 'Iron Maiden')
    results = remote.events(:artist_name => 'As I Lay Dying')

    results = remote.users_events('jrmehle')

    results = remote.concert_setlists(2680726)
    results = remote.concert_setlists(2894471)


## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010-2012 Jared Mehle. See LICENSE for details.

## Thanks

Thanks to Akshay Dodeja and Tomasz Stachewicz for submitting code and pull requests.

A special thank you to Jon Nunemaker for the httparty which is used extensively within this
gem and for the twitter gem as inspiration.

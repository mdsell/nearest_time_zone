# NearestTimeZone

Quickly find the name of a time zone for a latitude and longitude *without relying on a web service*.

    NearestTimeZone.to(41.85, -87.65)
    => "America/Chicago"

On a whatever MacBook Air, the time to lookup a single time zone is ~0.000030 seconds. Fast.

## About

### GeoNames Source Data

The city data is based on the GeoNames [cities1000.zip](http://download.geonames.org/export/dump/) data. To compress the size of the gem, the latitudes and longitudes were rounded to one decimal point of precision.

### Kdtree

The [Kdtree](https://github.com/gurgeous/kdtree) gem is used to make the search so fast.

### Load Time

The kdtree and the cities are loaded into memory when the gem is loaded. If you'd like to make that faster, run `rake nearest_time_zone:dump` and the load time should drop significantly. The cities, time zones and kdtree will all be persisted to the file system when run that rake task.

## Installation

Add this line to your application's Gemfile:

    gem 'nearest_time_zone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nearest_time_zone

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

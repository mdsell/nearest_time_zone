require "bundler/gem_tasks"
require "./lib/nearest_time_zone"


namespace :nearest_time_zone do
  task :dump do
    File.open(File.expand_path("../data/cities.dump", __FILE__),"w") do |f|
      f.write Marshal.dump(NearestTimeZone::City.all)
    end

    File.open(File.expand_path("../data/time_zones.dump", __FILE__),"w") do |f|
      f.write Marshal.dump(NearestTimeZone::TimeZone.all)
    end

    File.open(File.expand_path("../data/kdtree.dump", __FILE__),"w") do |f|
      f.write Marshal.dump(NearestTimeZone::City.kdtree)
    end
  end
end

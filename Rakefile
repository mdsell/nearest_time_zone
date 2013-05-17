require "bundler/gem_tasks"
require "csv"
require "yaml"

task :generate_time_zone_db do
  file = File.open(File.expand_path("./data/db.txt"),"w")
  csv = CSV.generate do |csv|
    File.open("/Users/seandevine/Downloads/cities1000.txt", "r").each_line do |city|
      fields = city.split("\t")
      csv << [fields[4],fields[5],fields[17]]
    end
  end
  file.write csv
  file.close
end
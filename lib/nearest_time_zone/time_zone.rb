module NearestTimeZone
  class TimeZone

    attr_accessor :id, :name

    def initialize(id, name)
      self.id, self.name = id, name
    end

    def id=(value)
      @id = value.to_i
    end

    def self.all
      @all ||= load_all
    end

    def self.find(id)
      all[id.to_i]
    end

  private

    def self.load_all
      begin
        Marshal.load(File.read(File.expand_path("../../../data/time_zones.dump", __FILE__)))
      rescue
        time_zones = CSV.open(File.expand_path("../../../data/time_zones.txt", __FILE__))
        Hash[
          time_zones.collect do |time_zone|
            [time_zone[0].to_i, NearestTimeZone::TimeZone.new(time_zone[0].to_i, time_zone[1])]
          end
        ]
      end
    end

  end
end
module NearestTimeZone
  class City

    attr_accessor :id, :latitude, :longitude, :time_zone_id

    def initialize(id, latitude, longitude, time_zone_id)
      self.id, self.latitude, self.longitude, self.time_zone_id = id, latitude, longitude, time_zone_id
    end

    def self.kdtree
      @kdtree ||= build_kdtree
    end    

    def id=(value)
      @id = value.to_i
    end

    def latitude=(value)
      @latitude = value.to_f
    end

    def longitude=(value)
      @longitude = value.to_f
    end

    def self.all
      @all ||= load_all
    end

    def self.find(id)
      all[id.to_i]
    end

    def self.nearest(latitude, longitude)
      result = kdtree.nearest([latitude, longitude]) 
      all[result.data] if result
    end

    def time_zone
      TimeZone.find(time_zone_id)
    end

  private

    def self.load_all
      begin
        Marshal.load(File.read(File.expand_path("../../../data/cities.dump", __FILE__)))
      rescue
        cities = CSV.open(File.expand_path("../../../data/cities.txt", __FILE__))
        Hash[
          cities.collect do |city|
            [city[0].to_i, NearestTimeZone::City.new(*(0..3).collect { |n| city[n] })]
          end
        ]
      end
    end

    def self.build_kdtree
      begin
        Marshal.load(File.read(File.expand_path("../../../data/cities.dump", __FILE__)))
      rescue
        Geokdtree::Tree.new(2).tap do |tree|
          all.each { |_, city| tree.insert [city.latitude, city.longitude], city.id }
        end
      end
    end

  end
end

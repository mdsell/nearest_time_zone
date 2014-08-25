require 'spec_helper'

module NearestTimeZone
  describe City do

    let(:id) { 321123 }
    let(:latitude) { 12 }
    let(:longitude) { 21 }
    let(:time_zone_id) { 4 }
    subject { City.new(id, latitude, longitude, time_zone_id) }

    it "should have the right latitude" do
      subject.latitude.should == latitude
    end

    it "should have the right longitude" do
      subject.longitude.should == longitude
    end

    it "should have the right time zone id" do
      subject.time_zone_id.should == time_zone_id
    end

    it "the class should have a kdtree method" do
      City.kdtree.should be_a_kind_of Geokdtree::Tree
    end

    it "should expose all the cities as a hash with the id as the key" do
      City.all.first[0].should be_a_kind_of Integer
    end

    it "should have a nearest method that finds the right city" do
      City.nearest(37.2,68.9).should == City.find(220)
    end

    it "should have a time zone" do
      City.all.first[1].time_zone.should be_a_kind_of TimeZone
    end

    it "should ask for the right time zone" do
      city = City.all.first[1]
      TimeZone.should_receive(:find).with(city.time_zone_id)
      city.time_zone
    end
  end
end

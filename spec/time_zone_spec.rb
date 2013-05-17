require 'spec_helper'

module NearestTimeZone
  describe TimeZone do

    it "should expose all of the time zones with a hash with ids as keys" do
      TimeZone.all.first[0].should be_a_kind_of Integer
    end

    it "should expose all of the time zones as a hash with time zone objects as values" do
      TimeZone.all.first[1].should be_a_kind_of TimeZone
    end

    it "should have the class method find that returns the right time zone" do
      id = TimeZone.all.first[0]
      TimeZone.find(id).should == TimeZone.all.first[1]
    end

  end
end
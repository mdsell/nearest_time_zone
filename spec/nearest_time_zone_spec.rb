require 'spec_helper'

describe NearestTimeZone do

  it "should have the method to" do
    expect { NearestTimeZone.to(1, 3) }.to_not raise_error
  end

  it "should find the time zone name nearest to coordinates" do
    NearestTimeZone.to(41.8500, -87.6500).should == "America/Chicago"
  end

end
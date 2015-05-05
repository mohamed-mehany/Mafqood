require 'rails_helper'

RSpec.describe Location, type: :model do
  it "should be valid" do
    loc = Location.new
    loc.should_not be_valid
    loc.name = "Maadi"
    loc.should_not be_valid
    loc.name_ar = "المعادي"
    loc.should be_valid
  end
end

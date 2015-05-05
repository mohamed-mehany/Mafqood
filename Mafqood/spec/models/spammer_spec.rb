require 'rails_helper'

RSpec.describe Spammer, type: :model do
  it "should be added to spammer scope" do
    FactoryGirl.create(:user)
    FactoryGirl.create(:missing_post)
    FactoryGirl.create(:spammer)
    
    MissingPost.spammed.size.should == 1
    FindingPost.spammed.size.should == 0
    
    FactoryGirl.create(:finding_post)
    
    FindingPost.spammed.size.should == 1
  end
end

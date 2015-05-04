require 'rails_helper'

RSpec.describe Spammer, type: :model do
<<<<<<< HEAD
  it "after doing five actions in the action model it appears in the spammer model" do
    i = 0
    while i < 5
      action = Action.new
      action.user_id = 1
      action.ip = 1
      action.kind = 'verified'
      action.save
      i += 1
    end
      spammer = Spammer.first
      spammer.should eq(!nil)
  end

  it "the record is not added in the spammer model unless it visits the action model five times" do
    i = 0
    while i < 4
      action = Action.new
      action.user_id = 1
      action.ip = 1
      action.kind = 'verified'
      action.save
      spammer = Spammer.first
      spammer.should eq(nil)
      i += 1
    end

  end
  pending "add some examples to (or delete) #{__FILE__}"
=======
  it "should be added to spammer scope" do
    FactoryGirl.create(:user)
    FactoryGirl.create(:missing_post)
    FactoryGirl.create(:spammer)
    
    MissingPost.spammed.size.should == 1
    FindingPost.spammed.size.should == 0
    
    FactoryGirl.create(:finding_post)
    
    FindingPost.spammed.size.should == 1
  end
>>>>>>> 7c3822770a407ac19751013217f338fe854ddabf
end

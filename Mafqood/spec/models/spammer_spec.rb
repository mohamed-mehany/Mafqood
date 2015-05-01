require 'rails_helper'

RSpec.describe Spammer, type: :model do
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
end

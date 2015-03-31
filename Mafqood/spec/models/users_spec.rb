require 'rails_helper'

describe "User" do
  it "should be valid" do
    user = User.new
    user.name.should be_nil
    user.name = "Mark Morcos"
    user.email = "mark.yehia@gmail.com"
    user.save
    user.should be_valid
    account = Account.create(user: user, provider: "facebook", uid: "10153797115710260")
    telephone = Telephone.create(number: "01271577946")
    address = Address.create(text: "19B/1 Taqseem Ellaselky, New Maadi")
    user.accounts << account
    user.telephones << telephone
    user.addresses << address
    user.save
    user.accounts.size.should be == 1
  end
end

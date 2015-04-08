require 'rails_helper'

  describe MissingPostReport do
    it "is valid with a user_id, kind and missing_post_id" do
      missing = MissingPostReport.new(
        user_id: '1',
        missing_post_id: '1',
        kind: 'mine')
      expect(missing).to be_valid
    end

    it "is invalid without a user_id" do
      missing = MissingPostReport.new(user_id: nil)
      missing.valid?
      expect(missing.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without a kind" do
      missing = MissingPostReport.new(kind: nil)
      missing.valid?
      expect(missing.errors[:kind]).to include("can't be blank")
    end

    it "is invalid without an missing_post_id" do
      missing = MissingPostReport.new(missing_post_id: nil)
      missing.valid?
      expect(missing.errors[:missing_post_id]).to include("can't be blank")
    end
 end

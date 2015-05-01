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

    it "is valid with duplicate user_id, missing_post_id but a unique type" do
      report3 = MissingPostReport.create(
       user_id: 1,
       missing_post_id: 1,
       kind: 'spam')
      expect(report3).to be_valid
    end

    it "is valid with duplicate user_id, finding_post_id but a unique type" do
      report3 = MissingPostReport.create(
       user_id: 1,
       missing_post_id: 1,
       kind: 'spam')
      expect(report3).to be_valid
    end

    it "is valid with duplicate user_id, type but a unique finding_post_id" do
      report5 = MissingPostReport.create(
       user_id: 1,
       missing_post_id: 2,
       kind: 'mine')
      expect(report5).to be_valid
    end
 end

require 'rails_helper' 
  describe FindingPostReport do
    it "is invalid with a duplicate user_id, finding_post_id & type" do
      report1 = FindingPostReport.create(
       user_id: 1,
       finding_post_id: 1,
       kind: 'mine')
      report2 = FindingPostReport.create(
       user_id: 1,
       finding_post_id: 2,
       kind: 'mine')
      report2.valid?
      expect(report2.errors[:base]).to include("You have already reported this kid as yours!")
    end
    it "is valid with duplicate user_id, finding_post_id but a unique type" do
      report3 = FindingPostReport.create(
       user_id: 1,
       finding_post_id: 1,
       kind: 'spam')
      expect(report3).to be_valid
    end
    it "is valid with duplicate type, finding_post_id but a unique user_id" do
      report4 = FindingPostReport.create(
       user_id: 2,
       finding_post_id: 1,
       kind: 'mine')
      expect(report4).to be_valid
    end
    it "is valid with duplicate user_id, type but a unique finding_post_id" do
      report4 = FindingPostReport.create(
       user_id: 1,
       finding_post_id: 2,
       kind: 'mine')
      expect(report4).to be_valid
    end
end
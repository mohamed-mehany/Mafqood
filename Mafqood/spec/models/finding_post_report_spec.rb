require 'rails_helper' 
  describe FindingPostReport do
    it "is invalid with a duplicate user_id, finding_post_id & type" do
      report1 = FindingPostReport.new
      report1.user_id = 1
      report1.finding_post_id = 1
      report1.type = "mine"
      report1.save
      report2 = FindingPostReport.new
      report2.user_id = 1
      report2.finding_post_id = 1
      report2.type = "mine"
      report2.save
      expect(report2).to be_invalid
    end
    it "is valid with duplicate user_id, finding_post_id but a unique type" do
      report1 = FindingPostReport.new
      report1.user_id = 1
      report1.finding_post_id = 1
      report1.type = "mine"
      report1.save
      report3 = FindingPostReport.new
      report3.user_id = 1
      report3.finding_post_id = 1
      report3.type = "spam"
      report3.save
      expect(report3).to be_valid
    end
    it "is valid with duplicate type, finding_post_id but a unique user_id" do
      report1 = FindingPostReport.new
      report1.user_id = 1
      report1.finding_post_id = 1
      report1.type = "mine"
      report1.save
      report4 = FindingPostReport.new
      report4.user_id = 2
      report4.finding_post_id = 1
      report4.type = "mine"
      report4.save
      expect(report4).to be_valid
    end
    it "is valid with duplicate user_id, type but a unique finding_post_id" do
      report1 = FindingPostReport.new
      report1.user_id = 1
      report1.finding_post_id = 1
      report1.type = "mine"
      report1.save
      report5 = FindingPostReport.new
      report5.user_id = 1
      report5.finding_post_id = 2
      report5.type = "mine"
      report5.save
      expect(report5).to be_valid
    end
end
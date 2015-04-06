require 'rails_helper'
require 'finding_posts_controller'

RSpec.describe FindingPostsController, type: :controller do
  describe "GET #report_returned" do
    it "updates status flag to true" do
      get :report_returned, id: FactoryGirl.create(:finding_post)
      assigns(:finding_post).status.should eq(true)
    end

    it "updates status flag to false" do
      finding_post = FactoryGirl.create(:finding_post)
      finding_post.status = true
      finding_post.save
      get :report_returned, id: finding_post.id
      assigns(:finding_post).status.should eq(false)
    end    
  end
end
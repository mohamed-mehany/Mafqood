require 'rails_helper'
require 'missing_posts_controller'

RSpec.describe MissingPostsController, type: :controller do
  describe "GET #report_found" do
    it "updates status flag to true" do
      get :report_found, id: FactoryGirl.create(:missing_post)
      assigns(:missing_post).status.should eq(true)
    end

    it "updates status flag to false" do
      missing_post = FactoryGirl.create(:missing_post)
      missing_post.status = true
      missing_post.save
      get :report_found, id: missing_post.id
      assigns(:missing_post).status.should eq(false)
    end    
  end
end

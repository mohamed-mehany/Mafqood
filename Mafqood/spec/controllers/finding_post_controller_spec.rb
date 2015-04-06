require 'rails_helper'
require 'finding_posts_controller'

RSpec.describe FindingPostsController, type: :controller do
  describe "GET #report_returned" do
    it "updates status flag to true" do
      get :report_returned, id: FactoryGirl.create(:finding_post)
      expect(assigns(:finding_post).status).to eq(true)
    end

    it "updates status flag to false" do
      finding_post = FactoryGirl.create(:finding_post)
      finding_post.status = true
      finding_post.save
      get :report_returned, id: finding_post.id
      expect(assigns(:finding_post).status).to eq(false)
    end 
    
    it "redirects to my posts" do
      get :report_returned, id: FactoryGirl.create(:finding_post)
      expect(response).to redirect_to my_posts_path
    end   

    it "adds a flash notice" do
      get :report_returned, id: FactoryGirl.create(:finding_post)
      expect(flash[:notice]).to eql("Your Post status has been updated successfully")
    end

  end
end
require 'rails_helper'
require 'missing_posts_controller'

RSpec.describe MissingPostsController, type: :controller do
  describe "GET #report_found" do
    it "updates status flag to true" do
      get :report_found, id: FactoryGirl.create(:missing_post)
      expect(assigns(:missing_post).status).to eq(true)
    end

    it "updates status flag to false" do
      missing_post = FactoryGirl.create(:missing_post)
      missing_post.status = true
      missing_post.save
      get :report_found, id: missing_post.id
      expect(assigns(:missing_post).status).to eq(false)
    end 

    it "redirects to my posts" do
      get :report_found, id: FactoryGirl.create(:missing_post)
      expect(response).to redirect_to my_posts_path
    end   

    it "adds a flash notice" do
      get :report_found, id: FactoryGirl.create(:missing_post)
      expect(flash[:notice]).to eql("Your Post status has been updated successfully")
    end

  end
end

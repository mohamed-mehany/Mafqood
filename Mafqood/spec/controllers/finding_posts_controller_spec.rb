require 'rails_helper'


RSpec.describe FindingPostsController, type: :controller do
  render_views
  image_src = File.join(Rails.root, "public/uploads/finding_post/image/1/smile.png")
  src_file = File.new(image_src)

  let(:valid_attributes) {
    {name: 'ebram', age: 10, gender: true, location: 'Egypt', description: 'tall', special_signs:'no',contact_info: 11234567899,:image =>src_file}
  }

  let(:invalid_attributes) {
    {name: '', age: -2, gender: true, location: 'Egypt', description: 'tall', special_signs:'no',contact_info: 4567899}
  }
  #let(:user){ {id:1}}

  #let(:valid_session) { {} }
  #before { allow(controller).to receive(:current_user) { user } }
  describe "GET #edit" do
    it "assigns the requested finding_post as @finding_post" do
      finding_post = FindingPost.new
      finding_post.name = "ebram"
      finding_post.age = 10
      finding_post.gender = true
      finding_post.location = 'Egypt'
      finding_post.description = 'tall'
      finding_post.special_signs = 'no'
      finding_post.contact_info = 11234567899
      finding_post.user_id = 1
      image_src = File.join(Rails.root, "public/uploads/finding_post/image/1/smile.png")
      src_file = File.new(image_src)
      finding_post.image = src_file
      finding_post.save
      user = User.new
      user.name = 'ebram'
      user.email = 'lol@hotmail.com'
      user.save
      allow(controller).to receive(:current_user) {user}  
      get :edit, {:id => finding_post.to_param}
      expect(assigns(:finding_post)).to eq(finding_post)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "updated name"}
      }

      it "updates the requested finding_post" do
        finding_post = FindingPost.new
        finding_post.name = "ebram"
        finding_post.age = 10
        finding_post.gender = true
        finding_post.location = 'Egypt'
        finding_post.description = 'tall'
        finding_post.special_signs = 'no'
        finding_post.contact_info = 11234567899
        finding_post.user_id = 2
        image_src = File.join(Rails.root, "public/uploads/finding_post/image/1/smile.png")
        src_file = File.new(image_src)
        finding_post.image = src_file
        finding_post.save
        user = User.new
        user.name = 'ebram'
        user.email = 'lol@hotmail.com'
        user.save
        allow(controller).to receive(:current_user) {user} 
        put :update, {:id => finding_post.to_param, :finding_post => new_attributes}
        finding_post.reload
        expect(finding_post).to have_attributes(:name => "updated name")
      end

      it "assigns the requested finding_post as @finding_post" do
        finding_post = FindingPost.new
        finding_post.name = "ebram"
        finding_post.age = 10
        finding_post.gender = true
        finding_post.location = 'Egypt'
        finding_post.description = 'tall'
        finding_post.special_signs = 'no'
        finding_post.contact_info = 11234567899
        finding_post.user_id = 3
        image_src = File.join(Rails.root, "public/uploads/finding_post/image/1/smile.png")
        src_file = File.new(image_src)
        finding_post.image = src_file
        finding_post.save
        user = User.new
        user.name = 'ebram'
        user.email = 'lol@hotmail.com'
        user.save
        allow(controller).to receive(:current_user) {user} 
        put :update, {:id => finding_post.to_param, :finding_post => valid_attributes}
        expect(assigns(:finding_post)).to eq(finding_post)
      end

      it "redirects to index" do
        finding_post = FindingPost.new
        finding_post.name = "ebram"
        finding_post.age = 10
        finding_post.gender = true
        finding_post.location = 'Egypt'
        finding_post.description = 'tall'
        finding_post.special_signs = 'no'
        finding_post.contact_info = 11234567899
        finding_post.user_id = 4
        image_src = File.join(Rails.root, "public/uploads/finding_post/image/1/smile.png")
        src_file = File.new(image_src)
        finding_post.image = src_file
        finding_post.save
        user = User.new
        user.name = 'ebram'
        user.email = 'lol@hotmail.com'
        user.save
        allow(controller).to receive(:current_user) {user} 
        put :update, {:id => finding_post.to_param, :finding_post => valid_attributes}
        expect(response).to redirect_to :action => :index
      end
    end

    context "with invalid params" do
      it "assigns the finding_post as @finding_post" do
        finding_post = FindingPost.new
        finding_post.name = "ebram"
        finding_post.age = 10
        finding_post.gender = true
        finding_post.location = 'Egypt'
        finding_post.description = 'tall'
        finding_post.special_signs = 'no'
        finding_post.contact_info = 11234567899
        finding_post.user_id = 5
        image_src = File.join(Rails.root, "public/uploads/finding_post/image/1/smile.png")
        src_file = File.new(image_src)
        finding_post.image = src_file
        finding_post.save
        user = User.new
        user.name = 'ebram'
        user.email = 'lol@hotmail.com'
        user.save
        allow(controller).to receive(:current_user) {user} 
        put :update, {:id => finding_post.to_param, :finding_post => invalid_attributes}
        expect(assigns(:finding_post)).to eq(finding_post)
      end

      it "re-renders the 'edit' template" do
        finding_post = FindingPost.new
        finding_post.name = "ebram"
        finding_post.age = 10
        finding_post.gender = true
        finding_post.location = 'Egypt'
        finding_post.description = 'tall'
        finding_post.special_signs = 'no'
        finding_post.contact_info = 11234567899
        finding_post.user_id = 6
        image_src = File.join(Rails.root, "public/uploads/finding_post/image/1/smile.png")
        src_file = File.new(image_src)
        finding_post.image = src_file
        finding_post.save
        user = User.new
        user.name = 'ebram'
        user.email = 'lol@hotmail.com'
        user.save
        allow(controller).to receive(:current_user) {user} 
        put :update, {:id => finding_post.to_param, :finding_post => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end
  describe "PUT #mine" do
     
    it "successfully reports a kid as yours" do
      finding_post = FindingPost.new
      finding_post.name = "ebram"
      finding_post.age = 10
      finding_post.gender = true
      finding_post.location = 'Egypt'
      finding_post.description = 'tall'
      finding_post.special_signs = 'no'
      finding_post.contact_info = 11234567899
      finding_post.user_id = 7
      image_src = File.join(Rails.root, "public/uploads/finding_post/image/1/smile.png")
      src_file = File.new(image_src)
      finding_post.image = src_file
      finding_post.save
      user = User.new
      user.name = 'ebram'
      user.email = 'lol@hotmail.com'
      user.save 
      finding_post_report = FindingPostReport.new
      finding_post_report.user_id = 7
      finding_post_report.kind = 'mine'
      finding_post_report.finding_post_id = 7
      allow(controller).to receive(:current_user) {user}  
      get :mine, {:id => finding_post.to_param}
      expect(assigns(:finding_post_report).id).to eq(1)
    end
  end
end

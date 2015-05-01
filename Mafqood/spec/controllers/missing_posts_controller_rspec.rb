# require 'rails_helper'
#
#
# RSpec.describe MissingPostsController, type: :controller do
#   render_views
#   image_src = File.join(Rails.root, "public/uploads/missing_post/image/1/smile.png")
#   src_file = File.new(image_src)
#
#   let(:valid_attributes) {
#     {reporter_name: 'ebram', age: 10, gender: true, location: 'Egypt', description: 'tall', special_signs:'no',reporter_phone: 11234567899,:image =>src_file}
#   }
#
#   let(:invalid_attributes) {
#     {reporter_name: '', age: -2, gender: true, location: 'Egypt', description: 'tall', special_signs:'no',reporter_phone: 4567899}
#   }
#   #let(:user){ {id:1}}
#
#   #let(:valid_session) { {} }
#   #before { allow(controller).to receive(:current_user) { user } }
#   describe "GET #edit" do
#     it "assigns the requested missing_post as @missing_post" do
#       missing_post = MissingPost.new
#       missing_post.reporter_name = 'omar'
#       missing_post.age = 10
#       missing_post.gender = true
#       missing_post.location = 'Egypt'
#       missing_post.description = 'tall'
#       missing_post.special_signs = 'no'
#       missing_post.reporter_phone = 11234567899
#       missing_post.user_id = 1
#       image_src = File.join(Rails.root, "public/uploads/missing_post/image/1/smile.png")
#       src_file = File.new(image_src)
#       missing_post.image = src_file
#       missing_post.save
#       user = User.new
#       user.name = 'ebram'
#       user.email = 'lol@hotmail.com'
#       user.save
#       allow(controller).to receive(:current_user) {user}
#       get :edit, {:id => missing_post.to_param}
#       expect(assigns(:missing_post)).to eq(missing_post)
#     end
#   end
#
#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) {
#         {reporter_name: "updated reporter_name"}
#       }
#
#       it "updates the requested missing_post" do
#         missing_post = MissingPost.new
#         missing_post.reporter_name = 'omar'
#         missing_post.age = 10
#         missing_post.gender = true
#         missing_post.location = 'Egypt'
#         missing_post.description = 'tall'
#         missing_post.special_signs = 'no'
#         missing_post.reporter_phone = 11234567899
#         missing_post.user_id = 2
#         image_src = File.join(Rails.root, "public/uploads/missing_post/image/1/smile.png")
#         src_file = File.new(image_src)
#         missing_post.image = src_file
#         missing_post.save
#         user = User.new
#         user.name = 'ebram'
#         user.email = 'lol@hotmail.com'
#         user.save
#         allow(controller).to receive(:current_user) {user}
#         put :update, {:id => missing_post.to_param, :missing_post => new_attributes}
#         missing_post.reload
#         expect(missing_post).to have_attributes(:reporter_name => "updated reporter_name")
#       end
#
#       it "assigns the requested missing_post as @missing_post" do
#         missing_post = MissingPost.new
#         missing_post.reporter_name = 'omar'
#         missing_post.age = 10
#         missing_post.gender = true
#         missing_post.location = 'Egypt'
#         missing_post.description = 'tall'
#         missing_post.special_signs = 'no'
#         missing_post.reporter_phone = 11234567899
#         missing_post.user_id = 3
#         image_src = File.join(Rails.root, "public/uploads/missing_post/image/1/smile.png")
#         src_file = File.new(image_src)
#         missing_post.image = src_file
#         missing_post.save
#         user = User.new
#         user.name = 'ebram'
#         user.email = 'lol@hotmail.com'
#         user.save
#         allow(controller).to receive(:current_user) {user}
#         put :update, {:id => missing_post.to_param, :missing_post => valid_attributes}
#         expect(assigns(:missing_post)).to eq(missing_post)
#       end
#
#       it "redirects to index" do
#         missing_post = MissingPost.new
#         missing_post.reporter_name = 'omar'
#         missing_post.age = 10
#         missing_post.gender = true
#         missing_post.location = 'Egypt'
#         missing_post.description = 'tall'
#         missing_post.special_signs = 'no'
#         missing_post.reporter_phone = 11234567899
#         missing_post.user_id = 4
#         image_src = File.join(Rails.root, "public/uploads/missing_post/image/1/smile.png")
#         src_file = File.new(image_src)
#         missing_post.image = src_file
#         missing_post.save
#         user = User.new
#         user.name = 'ebram'
#         user.email = 'lol@hotmail.com'
#         user.save
#         allow(controller).to receive(:current_user) {user}
#         put :update, {:id => missing_post.to_param, :missing_post => valid_attributes}
#         expect(response).to redirect_to :action => :index
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns the missing_post as @missing_post" do
#         missing_post = MissingPost.new
#         missing_post.reporter_name = 'omar'
#         missing_post.age = 10
#         missing_post.gender = true
#         missing_post.location = 'Egypt'
#         missing_post.description = 'tall'
#         missing_post.special_signs = 'no'
#         missing_post.reporter_phone = 11234567899
#         missing_post.user_id = 5
#         image_src = File.join(Rails.root, "public/uploads/missing_post/image/1/smile.png")
#         src_file = File.new(image_src)
#         missing_post.image = src_file
#         missing_post.save
#         user = User.new
#         user.name = 'ebram'
#         user.email = 'lol@hotmail.com'
#         user.save
#         allow(controller).to receive(:current_user) {user}
#         put :update, {:id => missing_post.to_param, :missing_post => invalid_attributes}
#         expect(assigns(:missing_post)).to eq(missing_post)
#       end
#
#       it "re-renders the 'edit' template" do
#         missing_post = MissingPost.new
#         missing_post.reporter_name = 'omar'
#         missing_post.age = 10
#         missing_post.gender = true
#         missing_post.location = 'Egypt'
#         missing_post.description = 'tall'
#         missing_post.special_signs = 'no'
#         missing_post.reporter_phone = 11234567899
#         missing_post.user_id = 6
#         image_src = File.join(Rails.root, "public/uploads/missing_post/image/1/smile.png")
#         src_file = File.new(image_src)
#         missing_post.image = src_file
#         missing_post.save
#         user = User.new
#         user.name = 'ebram'
#         user.email = 'lol@hotmail.com'
#         user.save
#         allow(controller).to receive(:current_user) {user}
#         put :update, {:id => missing_post.to_param, :missing_post => invalid_attributes}
#         expect(response).to render_template("edit")
#       end
#     end
#   end
#   describe "PUT #report" do
#
#     it "successfully reports a kid as yours" do
#       missing_post = MissingPost.new
#       missing_post.reporter_name = 'omar'
#       missing_post.age = 10
#       missing_post.gender = true
#       missing_post.location = 'Egypt'
#       missing_post.description = 'tall'
#       missing_post.special_signs = 'no'
#       missing_post.reporter_phone = 11234567899
#       missing_post.user_id = 7
#       image_src = File.join(Rails.root, "public/uploads/missing_post/image/1/smile.png")
#       src_file = File.new(image_src)
#       missing_post.image = src_file
#       missing_post.save
#       user = User.new
#       user.name = 'ebram'
#       user.email = 'lol@hotmail.com'
#       user.save
#       missing_post_report = MissingPostReport.new
#       missing_post_report.user_id = 7
#       missing_post_report.kind = 'found'
#       missing_post_report.missing_post_id = 7
#       allow(controller).to receive(:current_user) {user}
#       get :report, {:id => missing_post.to_param}
#       expect(assigns(:missing_post_report).id).to eq(1)
#     end
#   end
# end

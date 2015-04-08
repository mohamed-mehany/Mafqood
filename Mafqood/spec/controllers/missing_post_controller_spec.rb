require 'rails_helper'
require 'missing_posts_controller'

RSpec.describe MissingPostsController, type: :controller, "create a new missing post" do
  integrate_views

  it "should redirect to index with a notice on successful save" do
    post 'create'
    flash[:notice].should_not be_null
    response.should redirect_to(action: "index")
  end
end

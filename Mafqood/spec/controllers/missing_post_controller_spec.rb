require File.dirname(__FILE__) + '/../spec_helper'

describe MissingPostsController, "create a new missing post" do
  integrate_views

  it "should redirect to index with a notice on successful save" do
    post 'create'
    flash[:notice].should_not be_null
    response.should redirect_to(action: "index")
  end
end

require 'rails_helper'

describe HomeController, type: :controller do
  describe "#index" do
    it "should get the default locale" do
      get :index
      response.should be_ok
      controller.params[:locale].should be_nil
    end
    it "should be able to set locale" do
      get :index, locale: "en"
      controller.params[:locale].should_not be_nil
    end
  end
end

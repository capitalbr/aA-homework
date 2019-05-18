require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "when the params are wrong" do
      it "checks if email and password are correct" do
        post :create, params: { user: { email: "whatever@whatever.com", password: "" } }
        expect(response).to render_template("new")
      expect(flash[:errors]).to be_present
      end

      it "checks if password is long enough (6 chars)" do
        post :create, params: { user: { email: "whatever@whatever.com", password: "fives" } }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "when params are valid" do
      it "takes user to sign in page if successful" do
        post :create, params: { user: { email: "whatever@whatever.com", password: "sixor>" } }
        expect(response).to redirect_to(new_session_url)
      end
    end
  end
end

require 'rails_helper'

describe User do
  subject(:user) do
    User.new(email: "whatever@whatever",
      password: "simple")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  
  it "creates a paswword digest if password given" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates session token before the validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "resets the session token for the user" do
      user.valid?
      old_token = user.session_token
      user.reset_session_token!

      
      expect(user.session_token).to_not eq(old_token)
    end

    it "reset session token returns the users session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "makes sure password is correct" do
      expect(user.is_password?("simple")).to be true
    end

    it "detects if password is not correct" do
      expect(user.is_password?("not_simple")).to be false
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns the user if given correct parameters" do
      expect(User.find_by_credentials("whatever@whatever", "simple")).to eq(user)
    end

    it "returns nil if parameters were bad" do
      expect(User.find_by_credentials("whatever@whatever", "wrong_pass")).to eq(nil)
    end
  end
end

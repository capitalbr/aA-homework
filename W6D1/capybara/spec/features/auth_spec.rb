require 'rails_helper'

feature "signing up" do

  scenario "has new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "user sign up" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "whatever@whatever.com"
      fill_in 'Password', :with => "simples"
      click_on "create user"
    end

    scenario "goes to sign-in page after they sign up" do
      expect(page).to have_content "Successfully created your account! Check your inbox for an activation email."
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "whatever@whatever.com"
      click_on "create user"
    end

    scenario "re-renders the new user page after failed signup" do
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end

end

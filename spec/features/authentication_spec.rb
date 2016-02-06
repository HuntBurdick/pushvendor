# spec/features/authentication_spec.rb

require 'spec_helper'

feature "the login process" do 
  before(:all) do
    StoreConfiguration.create()
  end
  
  scenario "has a new user page" do 
    visit new_user_session_url
    expect(page).to have_content "Sign in"
  end

  feature "signing up a user"  do
     before(:each) do
      clean_database
      create_default_user
      login("admin", "password")
     end

    scenario "flashes that the user has signed in" do
       expect(page).to have_content "Signed in successfully."
    end

    scenario "shows the dashboard on sign-in"  do
       expect(page).to have_content "PushVendor Point of Sale"
     end
  end

end
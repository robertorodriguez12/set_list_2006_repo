# As a visitor
# When I visit '/'
# and I can click a link that says "Sign Up to Be a User"
# and I can enter registration details in a form
# and submit that form
# Then I should see a welcome message with my username
# and my user details have been saved in the database.

require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit "/"

    click_on "Register as a User"

    expect(current_path).to eq("/users/new")

    username = "funbucket13"
    password = "test"

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Create User"

    expect(page).to have_content("Welcome, #{username}!")
  end

  it "keeps a user logged in after registering" do
    visit "/"

    click_on "Register as a User"

    username = "funbucket13"
    password = "test"

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Create User"

    visit '/profile'

    expect(page).to have_content("Hello, #{username}!")
  end
  
end

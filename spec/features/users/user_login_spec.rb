# As a registered user
# When I visit '/'
# and I click on a link that says "I already have an account"
# Then I should see a login form
# When I enter my username and password
# and submit the form
# I am redirected to the home page
# and I see a welcome message with my username
# and I should no longer see the link that says "I already have an account"
# and I should no longer see the link that says "Register as a User"
# and I should see a link that says "Log out"

require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(username: "funbucket13", password: "test")

    visit "/"

    click_on "I already have an account"

    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq('/')

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_link("Log out")
    expect(page).to_not have_link("Register as a User")
    expect(page).to_not have_link("I already have an account")
  end

  it "cannot log in with bad credentials" do
    user = User.create(username: "funbucket13", password: "test")

    visit "/"

    click_on "I already have an account"

    fill_in :username, with: user.username
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq('/login')

    expect(page).to have_content("Sorry, your credentials are bad.")
  end

end

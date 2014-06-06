require 'spec_helper'

feature "As a user with out login credentials", js: true do
  scenario "I am unable to log in" do
    visit "/"

    fill_in "Email", with: "person@example.com"
    fill_in "Password", with: "12345678"
    click_on "Sign in"

    expect(page).to have_content("Invalid email or password.")
  end
end

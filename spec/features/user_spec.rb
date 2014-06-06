require 'spec_helper'

feature "As a normal user to the site", js: true do
  before do
    Emotion.create!(name: "Happy")
    User.create!(email: "person@example.com", password: "12345678")
  end

  scenario "I can record my current mindset" do
    visit "/"
    fill_in "Email", with: "person@example.com"
    fill_in "Password", with: "12345678"
    click_on "Sign in"

    expect(page).to have_content("How are you?")

    click_on "Happy"
    expect(page).to have_content("We've recorded your mindset")
  end
end

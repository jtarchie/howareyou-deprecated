require 'spec_helper'

feature "As a normal user to the site", js: true do
  include PageDSL

  let!(:emotion) { Emotion.create!(name: "Happy", emotion_group: EmotionGroup.create!(name: "Default")) }
  let!(:other_emotion) { Emotion.create!(name: "Unhappy", emotion_group: EmotionGroup.create!(name: "Other")) }
  let!(:user) { User.create!(email: "person@example.com", password: "12345678") }

  scenario "I can record my current mindset" do
    visit "/"

    click_menu "Mindsets"
    sign_in

    expect(page).to have_content("How are you?")

    choose_mindset("Happy")
    sign_out
  end

  scenario "I can update my current emotion group" do
    visit "/"

    click_menu "Account"
    sign_in

    expect(page).to have_content("Emotion Group")

    choose "Default"
    click_on "Submit"
    expect(page).to have_content "Successfully update your account settings"

    click_menu "Mindsets"
    expect(page).to have_content "Happy"
    expect(page).to_not have_content "Unhappy"

    choose_mindset "Happy"
    sign_out
  end
end

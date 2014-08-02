Capybara.javascript_driver = :webkit

module PageDSL
  def click_menu(name)
    click_on name
  end

  def sign_in
    fill_in "Email", with: "person@example.com"
    fill_in "Password", with: "12345678"
    click_on "Sign in"
    expect(page).to have_content "Signed in successfully"
  end

  def sign_out
    click_menu "Sign Out"
    expect(page).to_not have_content "Sign Out"
  end

  def choose_mindset(mindset)
    choose "Happy"
    click_on "Submit"
    expect(page).to have_content("We've recorded your mindset")
  end
end

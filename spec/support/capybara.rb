Capybara.javascript_driver = :webkit

module PageDSL
  def click_menu(name)
    page.find(".navbar-toggle").click
    click_on name
  end
end

require 'rails_helper'

feature "pairing" do
  scenario "user can click link on picture and go to new pairings page" do

    create_user email: "user@example.com"
    create_user(name: "partner", email: "partner@example.com", photo_name: "face-02.jpeg")

    visit root_path
    click_on "Login"
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    find(".user-link").click

    expect(page).to have_content("Record a Pairing w/ partner")

    fill_in "pairing[date]", with: "01/08/2014"
    click_on "Create Pairing"

    expect(page).to have_content("8/1/2014")

  end
end
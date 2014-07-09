require 'rails_helper'

feature "User signs up through signup page"  do
  # As a user,
  # I want to edit my profile,
  # so I can change my information.

  # As a user,
  # I want to delete my profile,
  # so I can quit the game.

  # Acceptance criteria:
  # I see a signin that prompts for my username and password
  # I can access my profile after signing in
  # I can edit my profile information
  # I can delete my profile

  it "signs in as user if correctly inputted" do

    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    within('.new_user') do
      click_on "Sign in"
    end

    expect(page).to have_content "Sign out"
    expect(page).to have_content "Edit account"
  end

  it "fails to signs in as user if incorrectly inputted" do

    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: ("not" + user.password)

    within('.new_user') do
      click_on "Sign in"
    end

    expect(page).not_to have_content "Sign out"
    expect(page).to have_content "Invalid"
  end

  it "edits account information" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit "/"

    click_on "Edit account"

    fill_in "Current password", with: user.password

    fill_in "Password", with: "newpassword1"
    fill_in "Password confirmation", with: "newpassword1"

      click_on "Update"

    expect(page).to have_content "You updated your account successfully."
  end

  it "deletes account information" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit "/"

    click_on "Edit account"

    click_on "Cancel my account"

    expect(page).to have_content "cancelled"
    expect(page).to have_content "Sign up"
  end

end

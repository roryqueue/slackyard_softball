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

    visit "/users/sign_in"

    fill_in " User name", with: user.user_name
    fill_in " Password", with: user.password

    within('.form-actions') do
      click_on "Sign in"
    end

    expect(page).to have_content "Sign out"
    expect(page).to have_content "Edit account"
  end

  it "fails to signs in as user if incorrectly inputted" do

    user = FactoryGirl.create(:user)

    visit "/users/sign_in"

    fill_in " User name", with: user.user_name
    fill_in " Password", with: ("not" + user.password)

    within('.form-actions') do
      click_on "Sign in"
    end

    expect(page).not_to have_content "Sign out"
    expect(page).to have_content "invalid"
  end

  it "edits account information" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit "/"

    click_on "Edit account"

    fill_in " Password", with: user.password
    fill_in " Confirm password", with: user.password

    within('.form-actions') do
      click_on "Edit"
    end

    expect(page).to have_content "Updated successfully"
  end

  it "deletes account information" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit "/"

    click_on "Edit account"

    within('.form-actions') do
      click_on "Delete my account"
    end

    expect(page).to have_content "Account deleted"
    expect(page).to have_content "Sign up"
  end

end

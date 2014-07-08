require 'rails_helper'

feature "User signs up through signup page"  do
  # As a user,
  # I want to begin and persist a user profile,
  # so I can save my information.

  # Acceptance criteria:
  # I see a signup that prompts for my email, password, password confirmation
  # I am included as a User if I signup correctly

  it "creates a new user if correctly inputted" do
    visit new_user_registration_path

    fill_in "Email", with: "rjamesquinlan@gmail.com"
    fill_in "User name", with: "rory"

    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    within('.new_user') do
      click_on "Sign up"
    end

    expect(page).to have_content "Sign out"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end


  it "does not create a new user if nothing is inputted" do
    visit new_user_registration_path

    within('.new_user') do
      click_on "Sign up"
    end

    expect(page).to have_content "can't be blank"

  end

  it "does not create a new user if password confirmation does not match" do
    visit new_user_registration_path

    fill_in "Email", with: "rjamesquinlan@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "nomatch"

    within('.new_user') do
      click_on "Sign up"
    end

    expect(page).to have_content "doesn't match Password"
    expect(page).to have_content "Sign up"
  end

end

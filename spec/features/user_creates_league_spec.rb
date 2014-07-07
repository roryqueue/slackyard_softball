require 'spec_helper'

feature "User creates a new league" do
  # As a user,
  # I want to start a league as commissioner,
  # so I can play against my friends.
  #
  # Acceptance Criteria:
  #
  # * I create a league that persists in the database
  # * I am taken to the league page upon creation

  it "creates a league" do

    league = FactoryGirl.build(:league)
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit "/"

    click_on "Create a new league"

    fill_in " League name", with: team.name

    click_on "Create league"

    expect(page).to have_content league.name
    expect(page).to have_content "Commissioner: #{user.name}"
  end

  it "tries to create a league with incomplete info and gets error message" do

    league = FactoryGirl.build(:league)
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit "/"

    click_on "Create a new league"

    click_on "Create league"

    expect(page).not_to have_content league.name
    expect(page).to have_content "can't be blank"
  end

end

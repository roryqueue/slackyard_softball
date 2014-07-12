require 'rails_helper'

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

    click_on "Create your own league!"

    fill_in "Name", with: league.name

    click_on "Create League"

    expect(page).to have_content league.name
    expect(page).to have_content "Commissioner: #{user.user_name}"
  end

  it "tries to create a league with incomplete info and gets error message" do

    league = FactoryGirl.build(:league)
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit "/"

    click_on "Create your own league!"

    click_on "Create League"

    expect(page).not_to have_content league.name
    expect(page).to have_content "can't be blank"
  end

end

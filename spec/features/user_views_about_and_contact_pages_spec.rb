require 'rails_helper'

feature "User visits about and contact pages" do
  # As a visitor,
  # I want to find contact info
  # so I can contact the developer.
  #
  # As a visitor,
  # I want to find an explanation of the game
  # so I know how to play.
  #
  # Acceptance Criteria:
  #
  # * I see the developer's contact info
  # * I find links to the developer's social sites

  it "navigates from home page and finds contact info" do
    league = FactoryGirl.create(:league)

    visit "/"
    click_on "Contact"


    expect(page).to have_content "Rory"
    expect(page).to have_content "gmail"
    expect(page).to have_content "github"
    expect(page).to have_content "linkedin"
  end

  it "navigates from home page and finds contact info" do
    league = FactoryGirl.create(:league)

    visit "/"
    click_on "About"


    expect(page).to have_content "Join a League"
    expect(page).to have_content "Create a League"
    expect(page).to have_content "Build your Team"
  end
end

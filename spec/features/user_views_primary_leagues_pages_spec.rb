require 'rails_helper'

feature "User visits leagues index" do
  # As a visitor,
  # I want to see an list of league activity,
  # so I can read about what's going on.

  # As a visitor,
  # I want to view league details,
  # so I can see who is doing well and poorly.
  #
  # Acceptance Criteria:
  #
  # * I see titles of the index and show pages
  # * I see an existing league and team

  it "finds index page title and league" do
    league = FactoryGirl.create(:league)

    visit '/league'
    expect(page).to have_content "Leagues"
    expect(page).to have_content league.name
  end

  it "finds league name on its show page" do
    league = FactoryGirl.create(:league)
    team = FactoryGirl.create(:team, league_id: league.id)

    visit "/league/#{league.id}"
    expect(page).to have_content "Standings"
    expect(page).to have_content league.name
    expect(page).to have_content team.name
  end
end

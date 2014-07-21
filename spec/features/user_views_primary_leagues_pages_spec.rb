require 'rails_helper'

feature "User visits leagues index and show" do
  # As a visitor,
  # I want to see an list of league activity,
  # so I can read about what's going on.
  #
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

    visit leagues_path
    expect(page).to have_content "Leagues"
    expect(page).to have_content league.name
  end

  it "finds league name on its show page" do
    league = FactoryGirl.create(:league)
    team = FactoryGirl.create(:team, league_id: league.id)
    player = FactoryGirl.create(:player, team_id: team.id)

    visit league_path(league)


    expect(page).to have_content "Standings"
    expect(page).to have_content league.name
    expect(page).to have_content team.name
    expect(page).to have_content "Recent Games"
    expect(page).to have_content player.name
  end

  it "finds header and footer on league show page" do
    league = FactoryGirl.create(:league)

    visit league_path(league)
    expect(page).to have_content "Slackyard Softball"
    expect(page).to have_content "About"
  end

  it "finds team on its league show page" do
    team = FactoryGirl.create(:team)

    visit league_path(team.league)
    expect(page).to have_content "Standings"
    expect(page).to have_content team.name
  end
end

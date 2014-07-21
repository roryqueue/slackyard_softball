require 'rails_helper'

feature "User visits team show" do
  # As a visitor,
  # I want to see an list of team players and activity,
  # so I can read about what's going on.
  #
  # Acceptance Criteria:
  #
  # * I see team stats on home page
  # * I see league, lineups, and players listed on team home page


  it "finds team stats on home page" do
    team = FactoryGirl.create(:team)

    visit team_path(team)

    expect(page).to have_content "Batting"
    expect(page).to have_content "Pitching"
    expect(page).to have_content "Recent Games"
  end

  it "finds team's league listed on home page" do
    team = FactoryGirl.create(:team)

    visit team_path(team)

    expect(page).to have_content team.name
    expect(page).to have_content team.league.name
  end

  it "finds lineups listed on home page when team manager" do

    user = FactoryGirl.create(:user)

    team = FactoryGirl.create(:team, user: user)
    lineup = FactoryGirl.create(:lineup, team: team)


    sign_in_as(user)
    visit team_path(team)

    expect(page).to have_content lineup.nickname
  end

  it "finds players listed on home page" do
    player = FactoryGirl.create(:player)

    visit team_path(player.team)


    expect(page).to have_content player.name
  end
end

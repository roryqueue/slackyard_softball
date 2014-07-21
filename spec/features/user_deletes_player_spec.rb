require 'rails_helper'

feature "User creates a lineup for team" do
  # As a team manager,
  # I want to be able to kick a player off my team
  # to make room for better players
  #
  # Acceptance Criteria:
  #
  # * I can delete a player as team manager
  # * I can't delete a player if I'm not team manager

  it "deletes lineup" do

    user = FactoryGirl.create(:user)
    team = FactoryGirl.create(:team, user: user)
    player = FactoryGirl.create(:player, team: team)

    sign_in_as(user)

    visit team_path(team)

    click_on player.name

    click_on "Kick off team"

    expect(page).to have_content "#{player.name} has been kicked off the team!"
    expect(page).to have_content team.name
  end

  it "can't delete player if not manager" do

    player = FactoryGirl.create(:player)

    visit team_player_path(player.team, player)

    expect(page).to have_content player.name
    expect(page).not_to have_content "Kick off team"
  end
end
